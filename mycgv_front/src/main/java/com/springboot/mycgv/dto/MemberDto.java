package com.springboot.mycgv.dto;

import lombok.Data;

@Data
public class MemberDto {
	private int rno;
	private String id;
	private String pass;
	private String name;
	private String gender;
	private String email;
	private String zonecode;
	private String addr1;
	private String addr2;
	private String hp;
	private String pnumber;
	private String hobbyList;
	private String intro;
	private String mdate;
	
	private String email1;
	private String email2;
	private String pnum1;
	private String pnum2;
	private String pnum3;
	private String[] hobby;
	
	public String getPnumber() {
		if(pnumber == null) {
			return pnum1 + "-" + pnum2 + "-" + pnum3;
		}else {
			return pnumber;
		}
	}
	
	public String getHobbyList() {
		if(hobbyList == null) {
			return String.join(",", hobby);
		}else {
			return hobbyList;
		}
	}
	
	public String getEmail() {
		if(email == null) {
			return email1 + "@" + email2;
		}else {
			return email;
		}
	}
} 