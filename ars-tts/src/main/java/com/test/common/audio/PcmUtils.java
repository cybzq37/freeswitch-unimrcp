package com.test.common.audio;

import com.test.ivr.common.WaveHeader;
import net.labymod.opus.OpusCodec;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

public class PcmUtils {

    public static byte[] convert8BitTo16Bit(byte[] pcm8BitData) {
        byte[] pcm16BitData = new byte[pcm8BitData.length * 2];
        for (int i = 0; i < pcm8BitData.length; i++) {
            // 将 8 位 PCM 数据扩展为 16 位 PCM 数据
            short pcm16BitSample = (short) (pcm8BitData[i] << 8);

            // 将 16 位 PCM 数据拆分为两个字节并存储到结果数组中
            pcm16BitData[i * 2] = (byte) (pcm16BitSample & 0xFF);
            pcm16BitData[i * 2 + 1] = (byte) ((pcm16BitSample >> 8) & 0xFF);
        }
        return pcm16BitData;
    }

    /**
     *
     * @param pcmData 原始数据
     * @param bitsPerSample 位深度
     * @param channels 通道个数
     * @param samplesPerSec 采样率
     * @return
     * @throws IOException
     */
    public static byte[] convertToWav(byte[] pcmData, int bitsPerSample, int channels, int samplesPerSec) throws IOException {

        int PCMSize = pcmData.length;

        //填入参数，比特率等等。这里用的是16位单声道 8000 hz
        WaveHeader header = new WaveHeader();
        //长度字段 = 内容的大小（PCMSize) + 头部字段的大小(不包括前面4字节的标识符RIFF以及fileLength本身的4字节)
        header.fileLength = PCMSize + (44 - 8);
        header.FmtHdrLeth = 16;
        header.BitsPerSample = (short) bitsPerSample;      // 采样值的位深度，即每个样本的数值精度
        header.Channels = (short) channels;            // 通道数
        header.FormatTag = 0x0001;      // 0x0001 表示pcm格式
        header.SamplesPerSec = samplesPerSec;   // 采样率，每秒钟样本的数量
        header.BlockAlign = (short) (header.Channels * header.BitsPerSample / 8);
        header.AvgBytesPerSec = header.BlockAlign * header.SamplesPerSec;
        header.DataHdrLeth = PCMSize;

        byte[] h = header.getHeader();
        assert h.length == 44; //WAV标准，头部应该是44字节

        byte[] output = new byte[h.length + PCMSize];
        System.arraycopy(h, 0, output, 0, h.length);
        System.arraycopy(pcmData, 0, output, h.length, PCMSize);

//        ByteBuffer outBuf = ByteBuffer.allocate(h.length + PCMSize);
//        outBuf.put(h);
//        outBuf.put(pcmData);
//        byte[] output = outBuf.array();
        return output;
    }

    public static byte[] resample(byte[] srcData, int srcSampleRate, int srcChannels,
                                  int dstSampleRate, int dstChannels) {

        // 采样率48000Hz，1秒钟采样48000次，1ms采样48次，20ms为一帧，一帧48*20=960个采样，每个采样16bit即2个byte
        // 因为需要满足帧时间长度为10,20,40,60ms这些才能编码opus
        // bitrate 设置opus的默认传输速率
        // MaxFrameSize 单个帧容纳的采样点数量
        // MaxPacketSize 单个数据包的最大容量，以字节为单位

        // frame_size = 采样率 * 帧时间 = 48 * 20 = 960
        // this.frameSize = 960;
        // this.sampleRate = 48000;
        // this.channels = 1;
        // this.bitrate = 64000; // 64000(bits/s) / 8 = 8000(Bytes/s)
        // this.maxFrameSize = 6 * 960; // 单个帧容纳的采样点数量，单声道是960,  5.1是 6*960
        // this.maxPacketSize = 3 * 1276;

        // 保存输出字节数组
        try(ByteArrayOutputStream outputStream = new ByteArrayOutputStream()) {
            OpusCodec encodec = OpusCodec.newBuilder()
                    .withSampleRate(srcSampleRate)
                    .withChannels(srcChannels)
                    .withFrameSize(srcSampleRate * 20 * srcChannels / 1000)
                    .build();

            OpusCodec decodec = OpusCodec.newBuilder()
                    .withSampleRate(dstSampleRate)
                    .withChannels(dstChannels)
                    .withFrameSize(srcSampleRate * 20 * dstChannels / 1000)
                    .build();

            int offset = 0;
            byte[] buffer = new byte[encodec.getChannels() * encodec.getFrameSize() * 2];
            while (offset < srcData.length) {
                // 从 fileBytes 中读取一个 buffer 的数据
                int length = Math.min(buffer.length, srcData.length - offset);
                System.arraycopy(srcData, offset, buffer, 0, length);
                offset += length;

                //Encoding PCM data chunk
                byte[] encode = encodec.encodeFrame(buffer);

                //Decoding PCM data chunk
                byte[] decoded = decodec.decodeFrame(encode);

                outputStream.write(decoded);
            }

            return outputStream.toByteArray();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
