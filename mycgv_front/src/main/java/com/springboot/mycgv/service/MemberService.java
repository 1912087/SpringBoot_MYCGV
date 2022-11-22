package com.springboot.mycgv.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.mycgv.dto.MemberDto;
import com.springboot.mycgv.dto.PageDto;
import com.springboot.mycgv.dto.SessionDto;
import com.springboot.mycgv.mapper.MemberMapper;

@Service
public class MemberService {

	@Autowired
	private MemberMapper memberDao;
	
	public SessionDto getLogin(MemberDto dto) {
		return memberDao.getLogin(dto);
	}
	
	public int getJoin(MemberDto dto) {
		return memberDao.getJoin(dto);
	}
	
	public int getIdCheck(String id) {
		return memberDao.getIdCheck(id);
	}
	
	public List<MemberDto> getMemberList(PageDto pageDto) {
		return memberDao.getMemberList(pageDto);
	}
	
	public MemberDto getMemberContent(String id) {
		return memberDao.getMemberContent(id);
	}
}
