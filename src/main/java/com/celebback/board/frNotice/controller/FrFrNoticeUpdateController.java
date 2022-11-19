package com.celebback.board.frNotice.controller;

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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.celebback.board.frNotice.service.FrNoticeService;
import com.celebback.validate.UpdateGroup;
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
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/fr/frNotice")
public class FrFrNoticeUpdateController {
	@Inject
	FrNoticeService service;
	
	@GetMapping("{frannoticeNo}/form")
	public String frNoticeEdit(
			@PathVariable("frannoticeNo") int frannoticeNo
			, Model model
	) {
		if(!model.containsAttribute("frNotice")) {
			FrNoticeVO frNotice = service.retrieveFrNotice(frannoticeNo);
			model.addAttribute("frNotice", frNotice);
		}
		return "fr/board/frNoticeEdit";
	}
	
	@PutMapping("{frannoticeNo}")
	public String frNoticeUpdate(
			@Validated(UpdateGroup.class) @ModelAttribute("frNotice") FrNoticeVO frNotice
			, Errors errors
			, RedirectAttributes redirectAttributes
			, SessionStatus sessionStatus
	) {
		String viewName = null;
		
		if(!errors.hasErrors()) {
			service.updateFrNotice(frNotice);
			viewName = "redirect:/fr/frNotice/{frannoticeNo}";
			sessionStatus.setComplete();
		}else {
			String errorAttrName = BindingResult.MODEL_KEY_PREFIX + "notice";
			redirectAttributes.addFlashAttribute(errorAttrName, errors);
			viewName= "redirect:/fr/frNotice/{frannoticeNo}/form";
		}
		
		return viewName;
	}
}
