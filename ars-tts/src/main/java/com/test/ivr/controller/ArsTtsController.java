package com.test.ivr.controller;

import com.test.common.audio.PcmUtils;
import com.test.common.file.FileUtils;
import com.test.ivr.service.IArsTtsService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;

@Slf4j
@RestController
public class ArsTtsController {

    @Resource
    private IArsTtsService iArsTtsService;

    @Value("${spring.profiles.active}")
    private String env;

    @RequestMapping("/ars")
    public void ars(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws IOException {
        byte[] pcm16bit8k = IOUtils.toByteArray(httpServletRequest.getInputStream());
        log.info(pcm16bit8k.length + "");
        // header获取
        String contentId = httpServletRequest.getHeader("X-Content-ID");
        String channelId = httpServletRequest.getHeader("X-Channel-ID");
        String timestamp = httpServletRequest.getHeader("X-Timestamp");
        String clientIp = httpServletRequest.getHeader("X-Client-IP");
        String seatNumber = httpServletRequest.getHeader("X-Seat-Number");
        log.info("contentId:{}, channelId: {}, timestamp: {}, clientIp: {}, seatNumber: {}",
                contentId, channelId, timestamp, clientIp, seatNumber);
        FileUtils.appendBytesToFile(pcm16bit8k, "/opt/app/" + channelId + ".pcm");
    }


    @RequestMapping("/tts")
    public void tts(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws IOException {
        byte[] input = IOUtils.toByteArray(httpServletRequest.getInputStream());
        String intputText = new String(input, StandardCharsets.UTF_8);
        log.info("tts input text: {}", intputText);

        byte[] audio16k = iArsTtsService.tts(intputText);
        byte[] audio8K = PcmUtils.resample(audio16k, 16000,1,8000,1);

        OutputStream outputStream = httpServletResponse.getOutputStream();
        outputStream.write(audio8K);
        outputStream.flush();
        outputStream.close();
    }

}