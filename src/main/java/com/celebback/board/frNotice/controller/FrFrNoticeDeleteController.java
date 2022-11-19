package com.celebback.board.frNotice.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.celebback.board.frNotice.service.FrNoticeService;
import com.celebback.validate.DeleteGroup;
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
public class FrFrNoticeDeleteController {

	@Inject
	FrNoticeService service;
	
	@DeleteMapping("{frannoticeNo}")
	public String frNoticeDelete(
			@Validated(DeleteGroup.class) FrNoticeVO frNotice,
			Errors errors
	) {
		
		String viewName = null;
		
		if(!errors.hasErrors()) {
			service.deleteFrNotice(frNotice);
			viewName = "redirect:/fr/frNotice";
		}else {
			viewName = "redirect:/fr/frNotice/{frannoticeNo}";
		}
		
		return viewName;
	}
}
