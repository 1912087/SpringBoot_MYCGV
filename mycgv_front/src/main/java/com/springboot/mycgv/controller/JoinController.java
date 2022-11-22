package com.springboot.mycgv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springboot.mycgv.dto.MemberDto;
import com.springboot.mycgv.service.MemberService;

@Controller
public class JoinController {
	//Controller로 만드는 방법
		//1. @Controller 어노테이션 선언
		//2. @RequestMapping 선언 후 Mapping 값과 method 설정
		//3. view name을 반환할 메소드 생성
		
		@Autowired
		private MemberService memberService;
		
		@ResponseBody
		@GetMapping("/idCheck/{id}")
		public String idCheckController(@PathVariable String id) {
			int result = memberService.getIdCheck(id);
			return String.valueOf(result);
		}
		
		@PostMapping("/join")
		public String joinController(MemberDto dto, Model model) {
			String pageName = "";
			
			int result = memberService.getJoin(dto);
			if(result == 1) {
				model.addAttribute("join_result", "ok");
				pageName = "/login/login";
			}else {
				pageName = "error_page";
			}
			
			return pageName;
		}
		
		@GetMapping("/join")
		public String join() {
			return "/join/join";
		}
}
