package com.test.ivr.bd;

import com.baidu.aip.speech.AipSpeech;

public class BdClient {

    //设置APPID/AK/SK
    public static final String APP_ID = "36397252";
    public static final String API_KEY = "KsshEIbmBpq9HhPAHabkm4li";
    public static final String SECRET_KEY = "ohw7pWc0UpYuToAKLn1PpisG48GZKY5b";

    public static AipSpeech INSTANCE;

    static {
        // 初始化一个AipSpeech
        INSTANCE = new AipSpeech(APP_ID, API_KEY, SECRET_KEY);
        // 可选：设置网络连接参数
        INSTANCE.setConnectionTimeoutInMillis(2000);
        INSTANCE.setSocketTimeoutInMillis(60000);
    }
}
