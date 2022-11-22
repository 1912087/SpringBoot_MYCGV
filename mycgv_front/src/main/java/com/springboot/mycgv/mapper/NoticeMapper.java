package com.springboot.mycgv.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.mycgv.dto.NoticeDto;
import com.springboot.mycgv.dto.PageDto;

@Mapper
public interface NoticeMapper {
	List<NoticeDto> getNoticeList(PageDto pageDto);
	NoticeDto getNoticeContent(String nid);
	int getNoticeWrite(NoticeDto noticeDto);
	int getNoticeUpdate(NoticeDto noticeDto);
	int getNoticeDelete(NoticeDto noticeDto);
	int getNoticeHits(String nid);
}
