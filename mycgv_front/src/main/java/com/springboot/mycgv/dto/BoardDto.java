package com.springboot.mycgv.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class BoardDto extends FileDto {
	private int rno;
	private int bhits;
	private String bid;
	private String btitle;
	private String bcontent;
	private String bfile;
	private String bsfile;
	private String bdate;
	private MultipartFile file1;
	private String id;
	private String fileNone;
}
