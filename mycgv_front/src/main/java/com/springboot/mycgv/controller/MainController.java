package com.springboot.mycgv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.springboot.mycgv.service.MovieService;

@Controller
public class MainController {
	
	@Autowired
	private MovieService movieService;
	
	@GetMapping("/")
	public String root() {
		return "redirect:/index";
	}
	
	/**
	 * footer.do 페이지 호출
	 */
	@GetMapping("/footer")
	public String footer() {
		return "/footer";
	}
	
	/**
	 * hedaer.do 페이지 호출
	 */
	@GetMapping("/header")
	public String header() {
		return "/header";
	}
	
	/**
	 * index.do 페이지 호출
	 */
	@GetMapping("/index")
	public String index(Model model) {
		model.addAttribute("list", movieService.getIndexList());
		return "/index";
	}
	
}
