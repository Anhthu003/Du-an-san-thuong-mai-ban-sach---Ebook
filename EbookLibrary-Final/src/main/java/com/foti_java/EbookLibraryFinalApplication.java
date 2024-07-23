package com.foti_java;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class EbookLibraryFinalApplication {

	public static void main(String[] args) {
		SpringApplication.run(EbookLibraryFinalApplication.class, args);
	}

}
