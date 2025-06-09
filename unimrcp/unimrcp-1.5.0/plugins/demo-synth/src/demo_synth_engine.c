/*
 * Copyright 2008-2015 Arsen Chaloyan
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

 /*
  * Mandatory rules concerning plugin implementation.
  * 1. Each plugin MUST implement a plugin/engine creator function
  *    with the exact signature and name (the main entry point)
  *        MRCP_PLUGIN_DECLARE(mrcp_engine_t*) mrcp_plugin_create(apr_pool_t *pool)
  * 2. Each plugin MUST declare its version number
  *        MRCP_PLUGIN_VERSION_DECLARE
  * 3. One and only one response MUST be sent back to the received request.
  * 4. Methods (callbacks) of the MRCP engine channel MUST not block.
  *   (asynchronous response can be sent from the context of other thread)
  * 5. Methods (callbacks) of the MPF engine stream MUST not block.
  */

#include "mrcp_synth_engine.h"
#include "apt_consumer_task.h"
#include "apt_log.h"
#include "mpf_activity_detector.h"
#include "mpf_buffer.h"

#include <stdlib.h>
#include <curl.h>

#define SYNTH_ENGINE_TASK_NAME "Demo Synth Engine"

typedef struct demo_synth_engine_t demo_synth_engine_t;
typedef struct demo_synth_channel_t demo_synth_channel_t;
typedef struct demo_synth_msg_t demo_synth_msg_t;

/** Declaration of synthesizer engine methods */
static apt_bool_t demo_synth_engine_destroy(mrcp_engine_t* engine);
static apt_bool_t demo_synth_engine_open(mrcp_engine_t* engine);
static apt_bool_t demo_synth_engine_close(mrcp_engine_t* engine);
static mrcp_engine_channel_t* demo_synth_engine_channel_create(mrcp_engine_t* engine, apr_pool_t* pool);

static const struct mrcp_engine_method_vtable_t engine_vtable = {
	demo_synth_engine_destroy,
	demo_synth_engine_open,
	demo_synth_engine_close,
	demo_synth_engine_channel_create
};


/** Declaration of synthesizer channel methods */
static apt_bool_t demo_synth_channel_destroy(mrcp_engine_channel_t* channel);
static apt_bool_t demo_synth_channel_open(mrcp_engine_channel_t* channel);
static apt_bool_t demo_synth_channel_close(mrcp_engine_channel_t* channel);
static apt_bool_t demo_synth_channel_request_process(mrcp_engine_channel_t* channel, mrcp_message_t* request);

static const struct mrcp_engine_channel_method_vtable_t channel_vtable = {
	demo_synth_channel_destroy,
	demo_synth_channel_open,
	demo_synth_channel_close,
	demo_synth_channel_request_process
};

/** Declaration of synthesizer audio stream methods */
static apt_bool_t demo_synth_stream_destroy(mpf_audio_stream_t* stream);
static apt_bool_t demo_synth_stream_open(mpf_audio_stream_t* stream, mpf_codec_t* codec);
static apt_bool_t demo_synth_stream_close(mpf_audio_stream_t* stream);
static apt_bool_t demo_synth_stream_read(mpf_audio_stream_t* stream, mpf_frame_t* frame);

static const mpf_audio_stream_vtable_t audio_stream_vtable = {
	demo_synth_stream_destroy,
	demo_synth_stream_open,
	demo_synth_stream_close,
	demo_synth_stream_read,
	NULL,
	NULL,
	NULL,
	NULL
};

/** Declaration of demo synthesizer engine */
struct demo_synth_engine_t {
	apt_consumer_task_t* task;
};

/** Declaration of demo synthesizer channel */
struct demo_synth_channel_t {
	/** Back pointer to engine */
	demo_synth_engine_t* demo_engine;
	/** Engine channel base */
	mrcp_engine_channel_t* channel;

	/** Active (in-progress) speak request */
	mrcp_message_t* speak_request;
	/** Pending stop response */
	mrcp_message_t* stop_response;
	/** Estimated time to complete */
	apr_size_t             time_to_complete;
	/** Is paused */
	apt_bool_t             paused;
	/** Speech source (used instead of actual synthesis) */
	FILE* audio_file;
	//>>>
	const char* tts_url;
	mpf_buffer_t*		   audio_buffer;
};

typedef enum {
	DEMO_SYNTH_MSG_OPEN_CHANNEL,
	DEMO_SYNTH_MSG_CLOSE_CHANNEL,
	DEMO_SYNTH_MSG_REQUEST_PROCESS
} demo_synth_msg_type_e;

/** Declaration of demo synthesizer task message */
struct demo_synth_msg_t {
	demo_synth_msg_type_e  type;
	mrcp_engine_channel_t* channel;
	mrcp_message_t* request;
};


static apt_bool_t demo_synth_msg_signal(demo_synth_msg_type_e type, mrcp_engine_channel_t* channel, mrcp_message_t* request);
static apt_bool_t demo_synth_msg_process(apt_task_t* task, apt_task_msg_t* msg);

/** Declare this macro to set plugin version */
MRCP_PLUGIN_VERSION_DECLARE

/**
 * Declare this macro to use log routine of the server, plugin is loaded from.
 * Enable/add the corresponding entry in logger.xml to set a cutsom log source priority.
 *    <source name="SYNTH-PLUGIN" priority="DEBUG" masking="NONE"/>
 */
	MRCP_PLUGIN_LOG_SOURCE_IMPLEMENT(SYNTH_PLUGIN, "SYNTH-PLUGIN")

	/** Use custom log source mark */
#define SYNTH_LOG_MARK   APT_LOG_MARK_DECLARE(SYNTH_PLUGIN)

/** Create demo synthesizer engine */
MRCP_PLUGIN_DECLARE(mrcp_engine_t*) mrcp_plugin_create(apr_pool_t* pool)
{
	/* create demo engine */
	demo_synth_engine_t* demo_engine = apr_palloc(pool, sizeof(demo_synth_engine_t));
	apt_task_t* task;
	apt_task_vtable_t* vtable;
	apt_task_msg_pool_t* msg_pool;

	/* create task/thread to run demo engine in the context of this task */
	msg_pool = apt_task_msg_pool_create_dynamic(sizeof(demo_synth_msg_t), pool);
	demo_engine->task = apt_consumer_task_create(demo_engine, msg_pool, pool);
	if (!demo_engine->task) {
		return NULL;
	}
	task = apt_consumer_task_base_get(demo_engine->task);
	apt_task_name_set(task, SYNTH_ENGINE_TASK_NAME);
	vtable = apt_task_vtable_get(task);
	if (vtable) {
		vtable->process_msg = demo_synth_msg_process;
	}

	/* create engine base */
	return mrcp_engine_create(
		MRCP_SYNTHESIZER_RESOURCE, /* MRCP resource identifier */
		demo_engine,               /* object to associate */
		&engine_vtable,            /* virtual methods table of engine */
		pool);                     /* pool to allocate memory from */
}

/** Destroy synthesizer engine */
static apt_bool_t demo_synth_engine_destroy(mrcp_engine_t* engine)
{
	demo_synth_engine_t* demo_engine = engine->obj;
	if (demo_engine->task) {
		apt_task_t* task = apt_consumer_task_base_get(demo_engine->task);
		apt_task_destroy(task);
		demo_engine->task = NULL;
	}
	return TRUE;
}

/** Open synthesizer engine */
static apt_bool_t demo_synth_engine_open(mrcp_engine_t* engine)
{
	apt_log(SYNTH_LOG_MARK, APT_PRIO_INFO, "==========demo_synth_engine_open ...");
	demo_synth_engine_t* demo_engine = engine->obj;
	if (demo_engine->task) {
		apt_task_t* task = apt_consumer_task_base_get(demo_engine->task);
		apt_task_start(task);
	}
	return mrcp_engine_open_respond(engine, TRUE);
}

/** Close synthesizer engine */
static apt_bool_t demo_synth_engine_close(mrcp_engine_t* engine)
{
	demo_synth_engine_t* demo_engine = engine->obj;
	if (demo_engine->task) {
		apt_task_t* task = apt_consumer_task_base_get(demo_engine->task);
		apt_task_terminate(task, TRUE);
	}
	return mrcp_engine_close_respond(engine);
}

/** Create demo synthesizer channel derived from engine channel base */
static mrcp_engine_channel_t* demo_synth_engine_channel_create(mrcp_engine_t* engine, apr_pool_t* pool)
{
	mpf_stream_capabilities_t* capabilities;
	mpf_termination_t* termination;

	const mrcp_engine_config_t* config = mrcp_engine_config_get(engine);

	/* create demo synth channel */
	demo_synth_channel_t* synth_channel = apr_palloc(pool, sizeof(demo_synth_channel_t));
	synth_channel->demo_engine = engine->obj;
	synth_channel->speak_request = NULL;
	synth_channel->stop_response = NULL;
	synth_channel->time_to_complete = 0;
	synth_channel->paused = FALSE;
	synth_channel->audio_file = NULL;
	synth_channel->tts_url = apr_table_get(config->params, "TTS_URL");
	//>>>
	synth_channel->audio_buffer = mpf_buffer_create(pool);

	capabilities = mpf_source_stream_capabilities_create(pool);
	mpf_codec_capabilities_add(
		&capabilities->codecs,
		MPF_SAMPLE_RATE_8000 | MPF_SAMPLE_RATE_16000,
		"LPCM");

	/* create media termination */
	termination = mrcp_engine_audio_termination_create(
		synth_channel,        /* object to associate */
		&audio_stream_vtable, /* virtual methods table of audio stream */
		capabilities,         /* stream capabilities */
		pool);                /* pool to allocate memory from */

	/* create engine channel base */
	synth_channel->channel = mrcp_engine_channel_create(
		engine,               /* engine */
		&channel_vtable,      /* virtual methods table of engine channel */
		synth_channel,        /* object to associate */
		termination,          /* associated media termination */
		pool);                /* pool to allocate memory from */

	return synth_channel->channel;
}

/** Destroy engine channel */
static apt_bool_t demo_synth_channel_destroy(mrcp_engine_channel_t* channel)
{
	/* nothing to destroy */
	return TRUE;
}

/** Open engine channel (asynchronous response MUST be sent)*/
static apt_bool_t demo_synth_channel_open(mrcp_engine_channel_t* channel)
{
	return demo_synth_msg_signal(DEMO_SYNTH_MSG_OPEN_CHANNEL, channel, NULL);
}

/** Close engine channel (asynchronous response MUST be sent)*/
static apt_bool_t demo_synth_channel_close(mrcp_engine_channel_t* channel)
{
	return demo_synth_msg_signal(DEMO_SYNTH_MSG_CLOSE_CHANNEL, channel, NULL);
}

/** Process MRCP channel request (asynchronous response MUST be sent)*/
static apt_bool_t demo_synth_channel_request_process(mrcp_engine_channel_t* channel, mrcp_message_t* request)
{
	return demo_synth_msg_signal(DEMO_SYNTH_MSG_REQUEST_PROCESS, channel, request);
}

size_t write_callback(char* ptr, size_t size, size_t nmemb, void* userdata)
{
	mpf_buffer_t** buffer = (mpf_buffer_t**)userdata;
	const size_t data_len = size * nmemb;
	mpf_buffer_audio_write(*buffer, ptr, data_len);
	return data_len;
}

// 进行语音识别
static apt_bool_t tts(const char* src_text, demo_synth_channel_t* synth_channel) {
	CURL* curl;
	CURLcode res;
	curl_global_init(CURL_GLOBAL_ALL);
	curl = curl_easy_init();

	if (curl) {
		// SSL配置
		curl_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, 0L);
		curl_easy_setopt(curl, CURLOPT_SSL_VERIFYHOST, 0L);
		// 头部信息
		struct curl_slist* headers = NULL;
		headers = curl_slist_append(headers, "Content-Type: text/plain");
		curl_easy_setopt(curl, CURLOPT_HTTPHEADER, headers);
		// 连接信息
		curl_easy_setopt(curl, CURLOPT_POST, 1L);
		curl_easy_setopt(curl, CURLOPT_URL, synth_channel->tts_url);
		// 文件信息
		curl_easy_setopt(curl, CURLOPT_VERBOSE, 1L);
		curl_easy_setopt(curl, CURLOPT_POSTFIELDS, src_text);

		// 回调信息
		long	response_code;
		char* response_data = NULL;
		double	response_len = 0.0;
		curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_callback);  //设置回调函数
		curl_easy_setopt(curl, CURLOPT_WRITEDATA, &synth_channel->audio_buffer);        //设置写数据


		res = curl_easy_perform(curl);
		if (res != CURLE_OK) {
			fprintf(stderr, "curl_easy_perform() failed: %s\n", curl_easy_strerror(res));
			return FALSE;
		}

		/* Get response code */
		curl_easy_getinfo(curl, CURLINFO_RESPONSE_CODE, &response_code);
		printf("Response code: %ld\n", response_code);

		/* Get response data */
		curl_easy_getinfo(curl, CURLINFO_SIZE_DOWNLOAD, &response_len);
		if (response_len > 0) {
			printf("Response len:\n %.0f \n", response_len);
		}
		curl_easy_cleanup(curl);
		curl_global_cleanup();

		if (response_data) {
			free(response_data);
		}
	}
	else {
		return FALSE;
	}
	
	return TRUE;
}

//>>>>
static apt_bool_t synth_response_construct(mrcp_message_t* response, mrcp_status_code_e status_code, mrcp_synth_completion_cause_e completion_cause)
{
	apt_log(SYNTH_LOG_MARK, APT_PRIO_INFO, "==========synth_response_construct ...");
	mrcp_synth_header_t* synth_header = mrcp_resource_header_prepare(response);
	if (!synth_header) {
		return FALSE;
	}

	response->start_line.status_code = status_code;
	synth_header->completion_cause = completion_cause;
	mrcp_resource_header_property_add(response, SYNTHESIZER_HEADER_COMPLETION_CAUSE);
	return TRUE;
}
//<<<

/** Process SPEAK request */
static apt_bool_t demo_synth_channel_speak(mrcp_engine_channel_t* channel, mrcp_message_t* request, mrcp_message_t* response)
{
	demo_synth_channel_t* synth_channel = channel->method_obj;
	const mpf_codec_descriptor_t* descriptor = mrcp_engine_source_stream_codec_get(channel);

	if (!descriptor) {
		apt_log(SYNTH_LOG_MARK, APT_PRIO_WARNING, "Failed to Get Codec Descriptor " APT_SIDRES_FMT, MRCP_MESSAGE_SIDRES(request));
		response->start_line.status_code = MRCP_STATUS_CODE_METHOD_FAILED;
		return FALSE;
	}

	//>>> 获取要合成的语音文字信息，如果没有，则返回
	apt_str_t* body = &request->body;
	if (!body->length) {
		synth_channel->speak_request = NULL;
		synth_response_construct(response, MRCP_STATUS_CODE_MISSING_PARAM, SYNTHESIZER_COMPLETION_CAUSE_ERROR);
		mrcp_engine_channel_message_send(synth_channel->channel, response);
		return FALSE;
	}

	/* calculate estimated time to complete 根据文字数量计算预计完成时间 */
	synth_channel->time_to_complete = 0;
	//if (mrcp_generic_header_property_check(request, GENERIC_HEADER_CONTENT_LENGTH) == TRUE) {
	//	mrcp_generic_header_t* generic_header = mrcp_generic_header_get(request);
	//	if (generic_header) {
	//		synth_channel->time_to_complete = generic_header->content_length * 10; /* 10 msec per character */
	//	}
	//}


	response->start_line.request_state = MRCP_REQUEST_STATE_INPROGRESS;
	/* send asynchronous response */
	mrcp_engine_channel_message_send(channel, response);
	synth_channel->speak_request = request;

	// 识别语音，识别完成后发送时间，根据 body->buf 将内容写入 synth_channel->audio_buffer
	tts(body->buf, synth_channel);
	mpf_buffer_event_write(synth_channel->audio_buffer, MEDIA_FRAME_TYPE_EVENT);

	return TRUE;
}

/** Process STOP request */
static apt_bool_t demo_synth_channel_stop(mrcp_engine_channel_t* channel, mrcp_message_t* request, mrcp_message_t* response)
{
	demo_synth_channel_t* synth_channel = channel->method_obj;
	/* store the request, make sure there is no more activity and only then send the response */
	synth_channel->stop_response = response;
	return TRUE;
}

/** Process PAUSE request */
static apt_bool_t demo_synth_channel_pause(mrcp_engine_channel_t* channel, mrcp_message_t* request, mrcp_message_t* response)
{
	demo_synth_channel_t* synth_channel = channel->method_obj;
	synth_channel->paused = TRUE;
	/* send asynchronous response */
	mrcp_engine_channel_message_send(channel, response);
	return TRUE;
}

/** Process RESUME request */
static apt_bool_t demo_synth_channel_resume(mrcp_engine_channel_t* channel, mrcp_message_t* request, mrcp_message_t* response)
{
	demo_synth_channel_t* synth_channel = channel->method_obj;
	synth_channel->paused = FALSE;
	/* send asynchronous response */
	mrcp_engine_channel_message_send(channel, response);
	return TRUE;
}

/** Process SET-PARAMS request */
static apt_bool_t demo_synth_channel_set_params(mrcp_engine_channel_t* channel, mrcp_message_t* request, mrcp_message_t* response)
{
	mrcp_synth_header_t* req_synth_header;
	/* get synthesizer header */
	req_synth_header = mrcp_resource_header_get(request);
	if (req_synth_header) {
		/* check voice age header */
		if (mrcp_resource_header_property_check(request, SYNTHESIZER_HEADER_VOICE_AGE) == TRUE) {
			apt_log(SYNTH_LOG_MARK, APT_PRIO_INFO, "Set Voice Age [%"APR_SIZE_T_FMT"]",
				req_synth_header->voice_param.age);
		}
		/* check voice name header */
		if (mrcp_resource_header_property_check(request, SYNTHESIZER_HEADER_VOICE_NAME) == TRUE) {
			apt_log(SYNTH_LOG_MARK, APT_PRIO_INFO, "Set Voice Name [%s]",
				req_synth_header->voice_param.name.buf);
		}
	}

	/* send asynchronous response */
	mrcp_engine_channel_message_send(channel, response);
	return TRUE;
}

/** Process GET-PARAMS request */
static apt_bool_t demo_synth_channel_get_params(mrcp_engine_channel_t* channel, mrcp_message_t* request, mrcp_message_t* response)
{
	mrcp_synth_header_t* req_synth_header;
	/* get synthesizer header */
	req_synth_header = mrcp_resource_header_get(request);
	if (req_synth_header) {
		mrcp_synth_header_t* res_synth_header = mrcp_resource_header_prepare(response);
		/* check voice age header */
		if (mrcp_resource_header_property_check(request, SYNTHESIZER_HEADER_VOICE_AGE) == TRUE) {
			res_synth_header->voice_param.age = 25;
			mrcp_resource_header_property_add(response, SYNTHESIZER_HEADER_VOICE_AGE);
		}
		/* check voice name header */
		if (mrcp_resource_header_property_check(request, SYNTHESIZER_HEADER_VOICE_NAME) == TRUE) {
			apt_string_set(&res_synth_header->voice_param.name, "David");
			mrcp_resource_header_property_add(response, SYNTHESIZER_HEADER_VOICE_NAME);
		}
	}

	/* send asynchronous response */
	mrcp_engine_channel_message_send(channel, response);
	return TRUE;
}

/** Dispatch MRCP request */
static apt_bool_t demo_synth_channel_request_dispatch(mrcp_engine_channel_t* channel, mrcp_message_t* request)
{
	apt_bool_t processed = FALSE;
	mrcp_message_t* response = mrcp_response_create(request, request->pool);
	switch (request->start_line.method_id) {
	case SYNTHESIZER_SET_PARAMS:
		processed = demo_synth_channel_set_params(channel, request, response);
		break;
	case SYNTHESIZER_GET_PARAMS:
		processed = demo_synth_channel_get_params(channel, request, response);
		break;
	case SYNTHESIZER_SPEAK:
		processed = demo_synth_channel_speak(channel, request, response);
		break;
	case SYNTHESIZER_STOP:
		processed = demo_synth_channel_stop(channel, request, response);
		break;
	case SYNTHESIZER_PAUSE:
		processed = demo_synth_channel_pause(channel, request, response);
		break;
	case SYNTHESIZER_RESUME:
		processed = demo_synth_channel_resume(channel, request, response);
		break;
	case SYNTHESIZER_BARGE_IN_OCCURRED:
		processed = demo_synth_channel_stop(channel, request, response);
		break;
	case SYNTHESIZER_CONTROL:
		break;
	case SYNTHESIZER_DEFINE_LEXICON:
		break;
	default:
		break;
	}
	if (processed == FALSE) {
		/* send asynchronous response for not handled request */
		mrcp_engine_channel_message_send(channel, response);
	}
	return TRUE;
}

/** Callback is called from MPF engine context to destroy any additional data associated with audio stream */
static apt_bool_t demo_synth_stream_destroy(mpf_audio_stream_t* stream)
{
	return TRUE;
}

/** Callback is called from MPF engine context to perform any action before open */
static apt_bool_t demo_synth_stream_open(mpf_audio_stream_t* stream, mpf_codec_t* codec)
{
	return TRUE;
}

/** Callback is called from MPF engine context to perform any action after close */
static apt_bool_t demo_synth_stream_close(mpf_audio_stream_t* stream)
{
	return TRUE;
}

/** Callback is called from MPF engine context to read/get new frame */
static apt_bool_t demo_synth_stream_read(mpf_audio_stream_t* stream, mpf_frame_t* frame)
{
	//apt_log(SYNTH_LOG_MARK, APT_PRIO_INFO, "==========demo_synth_stream_read ...");


	demo_synth_channel_t* synth_channel = stream->obj;
	/* check if STOP was requested */
	if (synth_channel->stop_response) {
		/* send asynchronous response to STOP request */
		mrcp_engine_channel_message_send(synth_channel->channel, synth_channel->stop_response);
		synth_channel->stop_response = NULL;
		synth_channel->speak_request = NULL;
		synth_channel->paused = FALSE;
		//if (synth_channel->audio_file) {
		//	fclose(synth_channel->audio_file);
		//	synth_channel->audio_file = NULL;
		//}
		return TRUE;
	}

	/* check if there is active SPEAK request and it isn't in paused state */
	if (synth_channel->speak_request && synth_channel->paused == FALSE) {
		/* normal processing */
		apt_bool_t completed = FALSE;

		// 这里可能存在段溢出
		mpf_buffer_frame_read(synth_channel->audio_buffer, frame);
		/* raise SPEAK-COMPLETE event */
		if ((frame->type & MEDIA_FRAME_TYPE_EVENT) == MEDIA_FRAME_TYPE_EVENT) {
			frame->type &= ~MEDIA_FRAME_TYPE_EVENT;
			completed = TRUE;
		}

		//if (synth_channel->audio_file) {
		//	/* read speech from file */
		//	apr_size_t size = frame->codec_frame.size;
		//	if (fread(frame->codec_frame.buffer, 1, size, synth_channel->audio_file) == size) {
		//		frame->type |= MEDIA_FRAME_TYPE_AUDIO;
		//	}
		//	else {
		//		completed = TRUE;
		//	}
		//}
		//else {
		//	/* fill with silence in case no file available */
		//	if (synth_channel->time_to_complete >= CODEC_FRAME_TIME_BASE) {
		//		memset(frame->codec_frame.buffer, 0, frame->codec_frame.size);
		//		frame->type |= MEDIA_FRAME_TYPE_AUDIO;
		//		synth_channel->time_to_complete -= CODEC_FRAME_TIME_BASE;
		//	}
		//	else {
		//		completed = TRUE;
		//	}
		//}

		if (completed) {
			/* raise SPEAK-COMPLETE event */
			mrcp_message_t* message = mrcp_event_create(
				synth_channel->speak_request,
				SYNTHESIZER_SPEAK_COMPLETE,
				synth_channel->speak_request->pool);
			if (message) {
				/* get/allocate synthesizer header */
				mrcp_synth_header_t* synth_header = mrcp_resource_header_prepare(message);
				if (synth_header) {
					/* set completion cause */
					synth_header->completion_cause = SYNTHESIZER_COMPLETION_CAUSE_NORMAL;
					mrcp_resource_header_property_add(message, SYNTHESIZER_HEADER_COMPLETION_CAUSE);
				}
				/* set request state */
				message->start_line.request_state = MRCP_REQUEST_STATE_COMPLETE;

				synth_channel->speak_request = NULL;
				//if (synth_channel->audio_file) {
				//	fclose(synth_channel->audio_file);
				//	synth_channel->audio_file = NULL;
				//}
				//>>>
				mpf_buffer_restart(synth_channel->audio_buffer);
				/* send asynch event */
				mrcp_engine_channel_message_send(synth_channel->channel, message);
			}
		}
	}
	return TRUE;
}

static apt_bool_t demo_synth_msg_signal(demo_synth_msg_type_e type, mrcp_engine_channel_t* channel, mrcp_message_t* request)
{
	apt_bool_t status = FALSE;
	demo_synth_channel_t* demo_channel = channel->method_obj;
	demo_synth_engine_t* demo_engine = demo_channel->demo_engine;
	apt_task_t* task = apt_consumer_task_base_get(demo_engine->task);
	apt_task_msg_t* msg = apt_task_msg_get(task);
	if (msg) {
		demo_synth_msg_t* demo_msg;
		msg->type = TASK_MSG_USER;
		demo_msg = (demo_synth_msg_t*)msg->data;

		demo_msg->type = type;
		demo_msg->channel = channel;
		demo_msg->request = request;
		status = apt_task_msg_signal(task, msg);
	}
	return status;
}

static apt_bool_t demo_synth_msg_process(apt_task_t* task, apt_task_msg_t* msg)
{
	demo_synth_msg_t* demo_msg = (demo_synth_msg_t*)msg->data;
	switch (demo_msg->type) {
	case DEMO_SYNTH_MSG_OPEN_CHANNEL:
		/* open channel and send asynch response */
		mrcp_engine_channel_open_respond(demo_msg->channel, TRUE);
		break;
	case DEMO_SYNTH_MSG_CLOSE_CHANNEL:
		/* close channel, make sure there is no activity and send asynch response */
		mrcp_engine_channel_close_respond(demo_msg->channel);
		break;
	case DEMO_SYNTH_MSG_REQUEST_PROCESS:
		demo_synth_channel_request_dispatch(demo_msg->channel, demo_msg->request);
		break;
	default:
		break;
	}
	return TRUE;
}