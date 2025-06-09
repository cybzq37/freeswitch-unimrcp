package com.test.ivr.ali;

import com.alibaba.fastjson.JSONPath;
import com.test.common.http.HttpClient;

import java.util.HashMap;
public class SpeechRecognizerRESTful {

    public static String process(byte[] data, String format, int sampleRate,
                        boolean enablePunctuationPrediction,
                        boolean enableInverseTextNormalization,
                        boolean enableVoiceDetection) {
        /**
         * 设置HTTPS RESTful POST请求：
         * 1.使用HTTPS协议。
         * 2.语音识别服务域名：nls-gateway-cn-shanghai.aliyuncs.com。
         * 3.语音识别接口请求路径：/stream/v1/asr。
         * 4.设置必选请求参数：appkey、format、sample_rate。
         * 5.设置可选请求参数：enable_punctuation_prediction、enable_inverse_text_normalization、enable_voice_detection。
         */
        String url = "https://nls-gateway.aliyuncs.com/stream/v1/asr";
        String request = url;
        request = request + "?appkey=" + AliToken.appkey;
        request = request + "&format=" + format;
        request = request + "&sample_rate=" + sampleRate;
        if (enablePunctuationPrediction) {
            request = request + "&enable_punctuation_prediction=" + true;
        }
        if (enableInverseTextNormalization) {
            request = request + "&enable_inverse_text_normalization=" + true;
        }
        if (enableVoiceDetection) {
            request = request + "&enable_voice_detection=" + true;
        }

        /**
         * 设置HTTPS头部字段：
         * 1.鉴权参数。
         * 2.Content-Type：application/octet-stream。
         */
        HashMap<String, String> headers = new HashMap<String, String>();
        headers.put("X-NLS-Token", AliToken.getToken());
        headers.put("Content-Type", "application/octet-stream");

        /**
         * 发送HTTPS POST请求，返回服务端的响应。
         */
        String response = HttpClient.getInstance().postBinary(request, headers, data);
//        String response = HttpUtil.sendPostFile(request, headers, fileName);

        String result = "";
        if (response != null) {
            result = JSONPath.read(response, "result").toString();
        }
        return result;
    }

}