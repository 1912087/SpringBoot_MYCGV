package com.springboot.mycgv.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class MovieDto extends FileDto{
	private int rno;
	private String mid;
	private String mcategory;
	private String mname;
	private String mdesc;
	private String mdate;
	
	private String fid;
	private String mfile1;
	private String msfile1;
	private String mfile2;
	private String msfile2;
}
