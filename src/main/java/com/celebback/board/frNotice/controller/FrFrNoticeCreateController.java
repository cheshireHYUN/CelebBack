package com.celebback.board.frNotice.controller;

import java.io.File;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.security.core.Authentication;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.celebback.board.frNotice.dao.FrNoticeDAO;
import com.celebback.board.frNotice.service.FrNoticeService;
import com.celebback.validate.InsertGroup;
import com.celebback.vo.FrNoticeVO;

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
 * 2022. 8. 23.    정아영              1차 수정
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/fr/frNotice")
public class FrFrNoticeCreateController {
	
	@Inject
	FrNoticeService service;

	@Inject
	FrNoticeDAO frNoticeDao;

	@ModelAttribute("frNotice")
	public FrNoticeVO frNotice() {
		return new FrNoticeVO();
	}

	@GetMapping("form")
	public String frNoticeForm(Model model) {
		return "fr/board/frNoticeForm";
	}

	@PostMapping
	public String frNoticeInsert(
			@Validated(InsertGroup.class) @ModelAttribute("frNotice") FrNoticeVO frNotice, 
			Errors errors
	) {
		String viewName = null;
		
		if (!errors.hasErrors()) {
			service.createFrNotice(frNotice);
			viewName = "redirect:/fr/frNotice";
		} else {
			viewName = "fr/board/frNoticeForm";
		}

		return viewName;
	}

	@ResponseBody
	@PostMapping("/upload/image")
	public Map<String, Object> uploadImage(
			@RequestParam Map<String, Object> paramMap, 
			MultipartRequest request,
			HttpServletRequest req
	) throws Exception {
		MultipartFile uploadFile = request.getFile("upload");
		String uploadDir = req.getServletContext().getRealPath("/").replace("\\", "/") + "/static/upload/images/";
		String uploadId = UUID.randomUUID().toString() + "."
				+ FilenameUtils.getExtension(uploadFile.getOriginalFilename());
		uploadFile.transferTo(new File(uploadDir + uploadId));
		paramMap.put("url", "/static/upload/images/" + uploadId);
		return paramMap;
	}
}
