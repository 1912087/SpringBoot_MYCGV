package com.springboot.mycgv.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.mycgv.dto.BoardDto;
import com.springboot.mycgv.dto.PageDto;
import com.springboot.mycgv.mapper.BoardMapper;

@Service
public class BoardService {
	
	@Autowired
	private BoardMapper boardDao;
	
	public List<BoardDto> getList(PageDto dto){
		return boardDao.getList(dto);
	}
	
	public BoardDto getContent(String bid) {
		return boardDao.getContent(bid);
	}
	
	public int getWrite(BoardDto dto) {
		return boardDao.getWrite(dto);
	}
	
	public int getUpdate(BoardDto dto) {
		return boardDao.getUpdate(dto);
	}
	
	public int getDelete(BoardDto dto) {
		return boardDao.getDelete(dto);
	}
	
	public int getHits(String bid) {
		return boardDao.getHits(bid);
	}
}
