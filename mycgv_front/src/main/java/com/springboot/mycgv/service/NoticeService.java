package com.springboot.mycgv.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.mycgv.dto.NoticeDto;
import com.springboot.mycgv.dto.PageDto;
import com.springboot.mycgv.mapper.NoticeMapper;

@Service
public class NoticeService {

	@Autowired
	private NoticeMapper noticeDao;
	
	public List<NoticeDto> getNoticeList(PageDto pageDto) {
		return noticeDao.getNoticeList(pageDto);
	}
	
	public NoticeDto getNoticeContent(String nid) {
		return noticeDao.getNoticeContent(nid);
	}
	
	public int getNoticeWrite(NoticeDto noticeDto) {
		return noticeDao.getNoticeWrite(noticeDto);
	}
	
	public int getNoticeUpdate(NoticeDto noticeDto) {
		return noticeDao.getNoticeUpdate(noticeDto);
	}
	
	public int getNoticeDelete(NoticeDto noticeDto) {
		return noticeDao.getNoticeDelete(noticeDto);
	}
	
	public int getNoticeHits(String nid) {
		return noticeDao.getNoticeHits(nid);
	}
}
