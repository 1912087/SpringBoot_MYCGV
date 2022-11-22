package com.springboot.mycgv.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.springboot.mycgv.dto.BoardDto;
import com.springboot.mycgv.dto.PageDto;
import com.springboot.mycgv.dto.SessionDto;
import com.springboot.mycgv.service.BoardService;
import com.springboot.mycgv.service.FileService;
import com.springboot.mycgv.service.PageService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private FileService fileService;
	
	@Autowired
	private PageService pageService;
	
	@GetMapping("/board_list")
	public String board_list_root() {
		return "redirect:/board_list/1";
	}
	
	@GetMapping("/board_list/{rpage}")
	public String board_list(@PathVariable String rpage, Model model) {
		PageDto pageDto = null;
		if(!rpage.equals("access_reject")) {
			pageDto = pageService.getPageResult(rpage, "board");
		}else {
			pageDto = pageService.getPageResult("1", "board");
		}
		
		model.addAttribute("page", pageDto);
		model.addAttribute("list", boardService.getList(pageDto));
		
		return "/board/board_list";
	}
	
	
	@GetMapping("/board_content/{bid}/{rpage}")
	public String board_content(@PathVariable String bid, @PathVariable String rpage, Model model) {
		boardService.getHits(bid);
		model.addAttribute("vo", boardService.getContent(bid));
		model.addAttribute("rpage", rpage);
		
		return "/board/board_content";
	}
	
	@GetMapping("/board_write")
	public String board_write() {
		return "/board/board_write";
	}
	
	@PostMapping("/board_write")
	public String board_write(HttpSession session, BoardDto dto) throws Exception {
		SessionDto svo = (SessionDto) session.getAttribute("svo");
		dto.setId(svo.getId());
		
		if(fileService.fileCheck(dto.getFile1())) {
			dto = (BoardDto) fileService.init(dto);
			int result = boardService.getWrite(dto);
			if(result == 1) {
				fileService.saveFile(dto);
			}
		}else {
			dto.setFile("");
			dto.setSfile("");
			boardService.getWrite(dto);
		}
		return "redirect:/board_list/1";
	}
	
	@GetMapping("/board_update/{bid}/{rpage}")
	public String board_update(HttpSession session, @PathVariable String bid, @PathVariable String rpage, Model model) {
		SessionDto svo = (SessionDto)session.getAttribute("svo");
		BoardDto dto = boardService.getContent(bid);
		if(dto.getId().equals(svo.getId())) {
			model.addAttribute("vo", dto);
			model.addAttribute("rpage", rpage);
		}else {
			return "redirect:/board_list/access_reject";
		}
		return "/board/board_update";
	}
	
	@PostMapping("/board_update")
	public String board_update(BoardDto dto) throws Exception {
		if(fileService.fileCheck(dto.getFile1())) {
			String oldFile = dto.getSfile();
			dto = (BoardDto) fileService.init(dto);
			int result = boardService.getUpdate(dto);
			if(result == 1) {
				fileService.saveFile(dto);
				fileService.deleteFile(oldFile);
			}
		}else {
			if(dto.getFileNone().equals("y")) {
				fileService.deleteFile(dto.getSfile());
				dto.setFile("");
				dto.setSfile("");
			}
			boardService.getUpdate(dto);
		}
		
		return "redirect:/board_list/1";
	}
	
	@PostMapping("/board_delete")
	public String board_delete(BoardDto dto) throws Exception {
		String oldFile = boardService.getContent(dto.getBid()).getBsfile();
		int result = boardService.getDelete(dto);
		if(result == 1) {
			fileService.deleteFile(oldFile);
		}
		
		return "redirect:/board_list/1";
	}

	@GetMapping("/notice_list")
	public String notice_list_json_root() {
		return "/notice/notice_list";
	}
}
