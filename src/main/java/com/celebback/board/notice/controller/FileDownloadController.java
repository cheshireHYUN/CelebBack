package com.celebback.board.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.celebback.board.notice.service.NoticeService;
import com.celebback.vo.AttatchVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class FileDownloadController {
private final NoticeService service;
	
	@RequestMapping("/head/Notice/{postNo}/attatch/{attatchNo}")
	public String download(
			@PathVariable int postNo, 
			@PathVariable int attatchNo, 
			Model model) {
		AttatchVO attatch = service.downloadAttatch(attatchNo);
		model.addAttribute("attatch", attatch);
		return "downloadView";
	}
	
	@RequestMapping("/fr/Notice/{postNo}/attatch/{attatchNo}")
	public String frDownload(
			@PathVariable int postNo, 
			@PathVariable int attatchNo, 
			Model model) {
		AttatchVO attatch = service.downloadAttatch(attatchNo);
		model.addAttribute("attatch", attatch);
		return "downloadView";
	}
	
	@RequestMapping("/Notice/{postNo}/attatch/{attatchNo}")
	public String memberDownload(
			@PathVariable int postNo, 
			@PathVariable int attatchNo, 
			Model model) {
		AttatchVO attatch = service.downloadAttatch(attatchNo);
		model.addAttribute("attatch", attatch);
		return "downloadView";
	}
}
