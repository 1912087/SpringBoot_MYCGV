package com.springboot.mycgv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springboot.mycgv.dto.MovieDto;
import com.springboot.mycgv.dto.NoticeDto;
import com.springboot.mycgv.dto.PageDto;
import com.springboot.mycgv.service.FileService;
import com.springboot.mycgv.service.MemberService;
import com.springboot.mycgv.service.MovieService;
import com.springboot.mycgv.service.NoticeService;
import com.springboot.mycgv.service.PageService;

@Controller
public class AdminController {

	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private PageService pageService;
	
	@Autowired
	private FileService fileService;
	
	@GetMapping("/admin")
	public String admin() {
		return "/admin/admin";
	}
	
	@GetMapping("/access_reject")
	public String admin_fail() {
		return "/admin/admin_fail";
	}
	
	//--------------------- admin_notice ----------------------------
	
	@GetMapping("/admin_notice_list")
	public String admin_notice_list_root() {
		return "redirect:/admin_notice_list/1";
	}
	
	@GetMapping("/admin_notice_list/{rpage}")
	public String admin_notice_list(@PathVariable String rpage, Model model) {
		PageDto pageDto = pageService.getPageResult(rpage, "notice");
		
		model.addAttribute("page", pageDto);
		model.addAttribute("list", noticeService.getNoticeList(pageDto));
		
		return "/admin/admin_notice/admin_notice_list";
	}
	
	@GetMapping("/admin_notice_content/{nid}/{rpage}")
	public String admin_notice_content(@PathVariable String nid, @PathVariable String rpage, Model model) {
		noticeService.getNoticeHits(nid);
		model.addAttribute("vo", noticeService.getNoticeContent(nid));
		return "/admin/admin_notice/admin_notice_content";
	}
	
	@GetMapping("/admin_notice_write")
	public String admin_notice_write() {
		return "/admin/admin_notice/admin_notice_write";
	}
	
	@PostMapping("/admin_notice_write")
	public String admin_notice_write_post(NoticeDto noticeDto) throws Exception {
		if(fileService.fileCheck(noticeDto.getFile1())) {
			noticeDto = (NoticeDto) fileService.init(noticeDto);
			int result = noticeService.getNoticeWrite(noticeDto);
			if(result == 1) {
				fileService.saveFile(noticeDto);
			}
		}else {
			noticeDto.setFile("");
			noticeDto.setSfile("");
			noticeService.getNoticeWrite(noticeDto);
		}
		
		return "redirect:/admin_notice_list/1";
	}
	
	@GetMapping("/admin_notice_update/{nid}/{rpage}")
	public String admin_notice_update(@PathVariable String nid, @PathVariable String rpage, Model model) {
		model.addAttribute("vo", noticeService.getNoticeContent(nid));
		return "/admin/admin_notice/admin_notice_update";
	}
	
	@PostMapping("/admin_notice_update")
	public String admin_notice_update_post(NoticeDto noticeDto, String rpage) throws Exception {
		if(fileService.fileCheck(noticeDto.getFile1())) {
			String oldFile = noticeDto.getSfile();
			noticeDto = (NoticeDto) fileService.init(noticeDto);
			int result = noticeService.getNoticeUpdate(noticeDto);
			if(result == 1) {
				fileService.saveFile(noticeDto);
				fileService.deleteFile(oldFile);
			}
		}else {
			noticeService.getNoticeUpdate(noticeDto);
		}
		
		return "redirect:/admin_notice_list/"+rpage;
	}
	
	@RequestMapping({"/admin_notice_delete/{nid}/{rpage}", "/admin_notice_delete/{nid}/{rpage}/{nsfile}"})
	public String admin_notice_delete(@PathVariable(value = "nid") String nid,
									@PathVariable(value = "rpage") String rpage,
									@PathVariable(value = "nsfile", required = false) String nsfile) {
		if(nsfile == null) nsfile = "none";
		
		return "/admin/admin_notice/admin_notice_delete";
	}
	
	@PostMapping("/admin_notice_delete")
	public String admin_notice_delete_post(NoticeDto noticeDto) throws Exception {
		int result = noticeService.getNoticeDelete(noticeDto);
		if(result == 1) {
			fileService.deleteFile(noticeDto.getNsfile());
		}
		
		return "redirect:/admin_notice_list/1";
	}
	
	
	//----------------------------- admin_member ------------------------------
	@GetMapping("/admin_member_list")
	public String admin_member_list_root() {
		return "redirect:/admin_member_list/1";
	}
	
	@GetMapping("/admin_member_list/{rpage}")
	public String admin_member_list(@PathVariable String rpage, Model model) {
		PageDto pageDto = pageService.getPageResult(rpage, "member");
		model.addAttribute("page", pageDto);
		model.addAttribute("list", memberService.getMemberList(pageDto));
		
		return "/admin/admin_member/admin_member_list";
	}
	
	@GetMapping("/admin_member_content/{id}/{rpage}")
	public String admin_member_content(@PathVariable String id, @PathVariable String rpage, Model model) {
		model.addAttribute("vo", memberService.getMemberContent(id));
		model.addAttribute("rpage", rpage);
		return "/admin/admin_member/admin_member_content";
	}

	//----------------------------- admin_movie ------------------------------
	
	@GetMapping("/admin_movie_list")
	public String admin_movie_list() {
		return "redirect:/admin_movie_list/1";
	}
	
	@GetMapping("/admin_movie_list/{rpage}")
	public String admin_movie_list(@PathVariable String rpage, Model model) {
		PageDto pageDto = pageService.getPageResult(rpage, "movie");
		
		model.addAttribute("page", pageDto);
		model.addAttribute("list", movieService.getMovieList(pageDto));
		
		return "/admin/admin_movie/admin_movie_list";
	}
	
	@GetMapping("/admin_movie_content/{mid}/{rpage}")
	public String admin_movie_content(@PathVariable String mid, @PathVariable String rpage, Model model) {
		model.addAttribute("vo", movieService.getMovieContent(mid));
		return "/admin/admin_movie/admin_movie_content";
	}
	
	@GetMapping("/admin_movie_regist")
	public String admin_movie_regist() {
		return "/admin/admin_movie/admin_movie_regist";
	}
	
	@PostMapping("/admin_movie_regist")
	public String admin_movie_regist_post(MovieDto movieDto) throws Exception {
		int result = movieService.getMovieWrite(movieDto);
		if(result == 1) {
			if(fileService.fileCheck(movieDto.getFiles())) {
				movieDto = (MovieDto) fileService.init(movieDto);
				result += movieService.getMovieFileWrite(movieDto);
				if(result == 2) {
					fileService.saveFile(movieDto);
				}
			}else {
				for(int i = 0; i < movieDto.getFiles().length; i++) {
					movieDto.getFileList().add("");
					movieDto.getSfileList().add("");
				}
				movieDto.setFileList(movieDto.getFileList());
				movieDto.setSfileList(movieDto.getSfileList());
				
				movieService.getMovieFileWrite(movieDto);
			}
		}
		
		return "redirect:/admin_movie_list/1";
	}
	
	@GetMapping("/admin_movie_update/{mid}/{rpage}")
	public String admin_movie_update(@PathVariable String mid, @PathVariable String rpage, Model model) {
		model.addAttribute("vo", movieService.getMovieContent(mid));
		return "/admin/admin_movie/admin_movie_update";
	}
	
	@PostMapping("/admin_movie_update")
	public String admin_movie_update(MovieDto movieDto) throws Exception {
		int result = movieService.getMovieUpdate(movieDto);
		if(result == 1) {
			if(fileService.fileCheck(movieDto.getFiles())) {
				movieDto = (MovieDto) fileService.init(movieDto);
				result += movieService.getMovieFileUpdate(movieDto);
				if(result == 2) {
					fileService.saveFile(movieDto);
					if(!movieDto.getSfileList().get(0).equals("")) {
						fileService.deleteFile(movieDto.getMsfile1());
					}
					if(!movieDto.getSfileList().get(1).equals("")) {
						fileService.deleteFile(movieDto.getMsfile2());
					}
				}
			}//else는 업데이트할 파일이 없음
		}
		
		return "redirect:/admin_movie_list/1";
	}
	
	@PostMapping("/admin_movie_delete")
	public String admin_movie_delete(MovieDto movieDto) throws Exception {
		int result = movieService.getMovieDelete(movieDto.getMid());
		if(result == 1) {
			fileService.deleteFile(movieDto.getMsfile1());
			fileService.deleteFile(movieDto.getMsfile2());
		}
		
		return "redirect:/admin_movie_list/1";
	}
}
