package com.springboot.mycgv.dto;

import lombok.Data;

@Data
public class PageDto {
	private int startCount;
	private int endCount;
	private int pageSize;
	private int reqPage;
	private int pageCount;
	private int dbCount;
}
