package com.springboot.mycgv.dto;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FileDto {
	private String file;
	private String sfile;
	
	//객체를 생성하지 않으면 NullPointerException이 뜸
	private ArrayList<String> fileList = new ArrayList<String>();
	private ArrayList<String> sfileList = new ArrayList<String>();
	private MultipartFile[] files;
}
