package com.test.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class FileUtils {

    public static byte[] readBytesFromFile(String filePath) {
        File file = new File(filePath);
        byte[] fileBytes = new byte[(int) file.length()];
        try (FileInputStream fis = new FileInputStream(file)) {
            fis.read(fileBytes);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
        return fileBytes;
    }

    public static void writeBytesToFile(byte[] bytes, String filePath) {
        try (FileOutputStream fos = new FileOutputStream(filePath)) {
            fos.write(bytes);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 向文件追加字节数组
    public static void appendBytesToFile(byte[] bytes, String filePath) {
        try (FileOutputStream fos = new FileOutputStream(filePath, true)) {
            fos.write(bytes);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
