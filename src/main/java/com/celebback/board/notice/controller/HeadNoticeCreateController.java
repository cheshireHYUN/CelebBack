package com.celebback.board.notice.controller;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.celebback.board.notice.dao.NoticeDAO;
import com.celebback.board.notice.service.NoticeService;
import com.celebback.validate.InsertGroup;
import com.celebback.vo.NoticeVO;

/**
 * @author 정아영
 * @since 2022. 8. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                    수정자              수정내용
 * --------       --------    ----------------------
 * 2022. 8. 5.     정아영              최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/head/Notice")
public class HeadNoticeCreateController {
	@Inject
	NoticeService service;
	
	@Inject
	NoticeDAO noticeDao;
	
	@ModelAttribute("notice")
	public NoticeVO notice() {
		return new NoticeVO();
	}
	
	@ModelAttribute("lguList")
	public List<Map<String, Object>> lguList(){
		return noticeDao.selectLguList();
	}
	
	@GetMapping("form")
	public String NoticeForm(Model model) {
		return "head/board/noticeForm";
	}
	
	@PostMapping
	public String noticeInsert(
			@Validated(InsertGroup.class) @ModelAttribute("notice") NoticeVO notice
			, Errors errors
	) {
		String viewName = null;
		
		if(!errors.hasErrors()) {
			service.createNotice(notice);
			viewName = "redirect:/head/Notice";
		}else {
			viewName = "head/board/noticeForm";
		}
		
		return viewName;
	}
	
	@ResponseBody
	@PostMapping("/upload/image")
	public Map<String, Object> uploadImage(@RequestParam Map<String, Object> paramMap, MultipartRequest request, HttpServletRequest req) throws Exception
	{
		MultipartFile uploadFile = request.getFile("upload");
		String uploadDir = req.getServletContext().getRealPath("/").replace("\\", "/") + "/static/upload/images/";
		String uploadId = UUID.randomUUID().toString() + "." + FilenameUtils.getExtension(uploadFile.getOriginalFilename());
		uploadFile.transferTo(new File(uploadDir + uploadId));
		paramMap.put("url", "/static/upload/images/" + uploadId);
		return paramMap;
	}
}
