package com.test.ivr.service;

public interface IArsTtsService {

    /**
     * 语音转文字
     * @return
     */
    String ars(byte[] input);

    /**
     * 文字转语音
     * @param tts
     * @return
     */
    byte[] tts(String tts);


}
