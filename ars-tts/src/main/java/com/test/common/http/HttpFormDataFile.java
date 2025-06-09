package com.test.common.http;

import lombok.Data;

import java.io.File;

@Data
public class HttpFormDataFile {

    public String name;

    public String contentType;

    public String fileName;
    public byte[] fileData;
    public File file;

    private HttpFormDataFile() {}

    public HttpFormDataFile(String name, String fileName, String contentType, byte[] fileData) {
        if(isBlank(name)){
            this.name = "file";
        } else {
            this.name = name;
        }

        if(isBlank(fileName)){
            this.fileName = String.valueOf(System.currentTimeMillis());
        } else {
            this.fileName = fileName;
        }

        if(isBlank(contentType)) {
            this.contentType = "application/octet-stream";
        } else {
            this.contentType = contentType;
        }

        this.fileData = fileData;
    }

    public HttpFormDataFile(String name, String fileName, String contentType, File file) {
        this.name = name;
        if(isBlank(this.name)){
            this.name = "file";
        }

        this.fileName = String.valueOf(System.currentTimeMillis());
        if(file != null) {
            this.fileName = file.getName();
        }
        if(!isBlank(this.fileName)){
            this.fileName = fileName;
        }

        this.contentType = contentType;
        if(isBlank(contentType)) {
            this.contentType = "application/octet-stream";
        }

        this.file = file;
    }

    private static boolean isBlank(String str) {
        if (str == null || str.trim().isEmpty()) {
            return true;
        }
        return false;
    }
}
