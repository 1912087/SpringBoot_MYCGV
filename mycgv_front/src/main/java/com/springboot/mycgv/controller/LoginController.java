package com.springboot.mycgv.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.mycgv.dto.MemberDto;
import com.springboot.mycgv.dto.SessionDto;
import com.springboot.mycgv.service.MemberService;

@Controller
public class LoginController {
	//Bean Containter에서 이미 생성된 객체들 내의 해당하는 코드를 가져다 쓰겠다는 의미
		@Autowired
		private MemberService memberService;

		@GetMapping("/login")
		public String login(String auth, Model model) {
			
			model.addAttribute("auth", auth);
			
			return "/login/login";
		}
		
		@PostMapping("/login")
		public String loginCheckController(MemberDto dto, HttpSession session, Model model) {
			String pageName = "";
			
			SessionDto svo = memberService.getLogin(dto);
			
			if(svo != null) {
				if(svo.getLoginresult() == 1) {
					session.setAttribute("svo", svo);
					
					model.addAttribute("login_result", "ok");
					pageName = "redirect:/index";					
				}
			}else {
				model.addAttribute("login_result", "fail");
				pageName = "/login/login";
			}
			
			session.setAttribute("svo", svo);
			
			return pageName;
		}
		
		
		/**
		 * logout.do : 로그아웃
		 */
		@GetMapping("/logout")
		public String logout(HttpSession session, Model model) {
			
			SessionDto svo = (SessionDto) session.getAttribute("svo");

			if(svo != null) {
				session.invalidate();
				model.addAttribute("logout_result", "ok");
			}
			
			return "redirect:/index";
		}

}
