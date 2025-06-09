package com.test.ivr;

import net.labymod.opus.OpusCodec;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.io.IOException;

@SpringBootApplication
public class AsrTtsApplication {

	public static void main(String[] args) {
		try {
			OpusCodec.setupWithTemporaryFolder();
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		SpringApplication.run(AsrTtsApplication.class, args);
	}

}
