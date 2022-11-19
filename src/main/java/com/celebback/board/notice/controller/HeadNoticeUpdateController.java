package com.celebback.board.notice.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.celebback.board.notice.dao.NoticeDAO;
import com.celebback.board.notice.service.NoticeService;
import com.celebback.validate.UpdateGroup;
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
@SessionAttributes("notice")
public class HeadNoticeUpdateController {
	@Inject
	NoticeService service;
	
	@Inject
	NoticeDAO noticeDao;
	
//	@ModelAttribute("notice")
//	public NoticeVO notice() {
//		return new NoticeVO();
//	}
	
	@ModelAttribute("lguList")
	public List<Map<String, Object>> lguList(){
		return noticeDao.selectLguList();
	}
	
	@GetMapping("{postNo}/form")
	public String noticeEdit(
			@PathVariable("postNo") String postNo
			, Model model
			) {
		if(!model.containsAttribute("notice")) {
			NoticeVO notice = service.retrieveNotice(postNo);
			model.addAttribute("notice", notice);
		}
		return "head/board/noticeEdit";
	}
	
	@PutMapping("{postNo}")
	public String noticeUpdate(
			@Validated(UpdateGroup.class) @ModelAttribute("notice") NoticeVO notice
			, Errors errors
			, RedirectAttributes redirectAttributes
			, SessionStatus sessionStatus
	) {
		String viewName = null;
		
		if(!errors.hasErrors()) {
			service.updateNotice(notice);
			viewName = "redirect:/head/Notice/{postNo}";
			sessionStatus.setComplete();
		}else {
			String errorAttrName = BindingResult.MODEL_KEY_PREFIX + "notice";
			redirectAttributes.addFlashAttribute(errorAttrName, errors);
			viewName = "redirect:/head/Notice/{postNo}/form";
		}
		
		return viewName;
	}
}
