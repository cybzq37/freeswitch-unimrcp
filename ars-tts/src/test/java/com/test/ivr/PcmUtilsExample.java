package com.test.ivr;

import com.test.common.audio.PcmUtils;
import com.test.common.file.FileUtils;
import net.labymod.opus.OpusCodec;

import javax.sound.sampled.LineUnavailableException;
import java.io.IOException;


public class PcmUtilsExample {

    public static void main(String[] args) throws LineUnavailableException, IOException {
        OpusCodec.setupWithTemporaryFolder();
        String filepath = "D:\\Workspace\\IVR\\ars-tts\\target\\1693392764651.wav";
        byte[] fileBytes = FileUtils.readBytesFromFile(filepath);

        byte[] data = PcmUtils.resample(fileBytes, 16000, 1, 8000, 1);

        FileUtils.writeBytesToFile(data, "./target/test8k.pcm");
    }



}
