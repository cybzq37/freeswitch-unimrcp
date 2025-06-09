package com.test.common;

import com.test.common.http.HttpClient;
import org.junit.jupiter.api.Test;

import java.util.HashMap;

public class HttpClientTest {

    @Test
    public void postFormUrlencoded() {
        HashMap<String, String> params = new HashMap<>();
        params.put("aaa", "aaa");
        HttpClient.getInstance().postFormUrlencoded("http://127.0.0.1:8080/download", null, null);
    }
}
