package com.test.ivr.ali;

import com.alibaba.nls.client.AccessToken;

import java.io.IOException;

public class AliToken {
    public static String appkey = "YNCCcC3NPdXRZKQi";
    private static String token;
    private static long expireTime;

    public static String getToken () {
        if(token != null && expireTime > System.currentTimeMillis()) {
            return token;
        }
        AccessToken accessToken = new AccessToken("LTAIQs90CiKDLR2d", "toeb639986GsMNBozxNs8tgCd9M0CW");
        try {
            accessToken.apply();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        token = accessToken.getToken();
        expireTime = accessToken.getExpireTime();
        return token;
    }
}
