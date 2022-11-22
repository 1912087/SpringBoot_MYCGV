package com.springboot.mycgv.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class NoticeDto extends FileDto {
	private int rno;
	private String nid;
	private String ntitle;
	private String ncontent;
	private String nfile;
	private String nsfile;
	private int nhits;
	private String ndate;
	MultipartFile file1;
}
