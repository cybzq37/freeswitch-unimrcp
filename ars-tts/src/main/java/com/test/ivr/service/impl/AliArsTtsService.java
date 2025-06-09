package com.test.ivr.service.impl;

import com.test.ivr.ali.SpeechRecognizerRESTful;
import com.test.ivr.ali.SpeechSynthesizerRestful;
import com.test.ivr.bd.BdClient;
import com.test.ivr.service.IArsTtsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StringUtils;

@Slf4j
public class AliArsTtsService implements IArsTtsService {

    @Override
    public String ars(byte[] input) {
        String inputText = "";
        // 百度识别
        org.json.JSONObject data = BdClient.INSTANCE.asr(input, "pcm", 16000, null);
        if(data != null && data.getInt("err_no") == 0) {
            org.json.JSONArray result = data.getJSONArray("result");
            for(int i=0; i<result.length(); i++) {
                inputText += result.getString(i);
            }
        }
        // 阿里识别
        if(StringUtils.isEmpty(inputText)){
            inputText = SpeechRecognizerRESTful.process(input, "pcm", 16000, true, true, false);
        }
        return inputText;
    }

    @Override
    public byte[] tts(String text) {
        byte[] result = SpeechSynthesizerRestful.processPOSTRequest(text, "wav", 16000, "siyue");
        return result;
    }
}
