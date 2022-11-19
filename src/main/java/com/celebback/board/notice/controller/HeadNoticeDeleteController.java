package com.celebback.board.notice.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.celebback.board.notice.service.NoticeService;
//import com.celebback.common.InvalidPasswordException;
import com.celebback.validate.DeleteGroup;
import com.celebback.vo.NoticeVO;

import lombok.extern.slf4j.Slf4j;

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
@Slf4j
@Controller
@RequestMapping("/head/Notice")
public class HeadNoticeDeleteController {

	@Inject
	NoticeService service;
	
	@DeleteMapping("{postNo}")
	public String deleteNotice(
			@Validated(DeleteGroup.class) NoticeVO notice,
			Errors errors,
			RedirectAttributes redirectAttributes
	) {
		
		String viewName = null;
		
		log.info("*******notice******* {}", notice);

		if(!errors.hasErrors()) {
			service.deleteNotice(notice);
			viewName = "redirect:/head/Notice";
		}else {
			viewName = "redirect:/head/Notice/{postNo}";
		}
		
		return viewName;
	}
}
