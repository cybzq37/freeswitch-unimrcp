package com.test.ivr;

import com.test.common.file.FileUtils;
import net.labymod.opus.OpusCodec;

import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.LineUnavailableException;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;


public class TranscateExample {
    private static AudioFormat format =
            new AudioFormat(AudioFormat.Encoding.PCM_SIGNED, 8000, 16, 1, 2, 8000, false);

    public static void main(String[] args) throws LineUnavailableException, IOException {
        OpusCodec.setupWithTemporaryFolder();

        // 采样率为48000，所以一毫秒采样48次, 20ms为960个采样，每个采样是16bit即 2个byte，所以每帧大小为1,920byte, 1秒钟96,000字节
        // 因为需要满足帧时间长度为10,20,40,60ms这些才能编码opus
        // frame_size = 采样率 * 帧时间 = 48 * 20 = 960
//        this.frameSize = 960;
//        this.sampleRate = 48000;
//        this.channels = 1;
//        this.bitrate = 64000;     // 64000(bits/s) / 8 = 8000(Bytes/s)
//        this.maxFrameSize = 6 * 960;  // 单个帧容纳的采样点数量，单声道是960,  5.1是 6*960
//        this.maxPacketSize = 3 * 1276;

        OpusCodec decodec = OpusCodec.newBuilder()
                .withSampleRate(8000)
                .withChannels(1)
                .withBitrate(64000)
                .withFrameSize(160)   // 16 * 20 = 320
//                .withMaxFrameSize()     // 单个帧容纳的采样点数量
//                .withMaxPacketSize()    // 单个数据包的最大容量，以字节为单位
                .build();

        OpusCodec encodec = OpusCodec.newBuilder()
                .withSampleRate(16000)
                .withChannels(1)
                .withBitrate(64000)
                .withFrameSize(320)   // 16 * 20 = 320
//                .withMaxFrameSize()     // 单个帧容纳的采样点数量
//                .withMaxPacketSize()    // 单个数据包的最大容量，以字节为单位
                .build();
/*
    Could also use the builder to customize the codec.
    OpusCodec.newBuilder()
            .withSampleRate(24000)
            ...
            .build();
*/


        String filepath = "D:\\Workspace\\IVR\\ars-tts\\target\\1693392764651.wav";
        byte[] fileBytes = FileUtils.readBytesFromFile(filepath);
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();


        ByteBuffer byteBuffer = ByteBuffer.allocate(fileBytes.length);

        int offset = 0;
        byte[] buffer = new byte[encodec.getChannels() * encodec.getFrameSize() * 2];
        while (offset < fileBytes.length) {
            // 从 fileBytes 中读取一个 buffer 的数据
            int length = Math.min(buffer.length, fileBytes.length - offset);
            System.arraycopy(fileBytes, offset, buffer, 0, length);
            offset += length;

            //Encoding PCM data chunk
            byte[] encode = encodec.encodeFrame(buffer);

            //Decoding PCM data chunk
            byte[] decoded = decodec.decodeFrame(encode);

            outputStream.write(decoded);
        }
        FileUtils.writeBytesToFile(outputStream.toByteArray(), "./target/test8k.pcm");
        outputStream.close();
    }



}
