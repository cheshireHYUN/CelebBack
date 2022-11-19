package com.celebback.fr.analysis.popular.controller;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.celebback.fr.analysis.popular.service.PopularService;
import com.celebback.vo.PopularVO;

/**
 * 
 * @author 최서현
 * @since 2022. 8. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 5.       최서현      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/fr/analysis/popular")
public class PopularRetrieveController {
	
	@Inject
	PopularService service;
	
	@RequestMapping("/list")
	public String popularList() {
		return "fr/analysis/popular/popularList";
	}
	
	@ResponseBody
	@PostMapping("/list")
	public PopularVO popularListPost(@RequestParam("stDate") String stDate, 
			@RequestParam("enDate") String enDate,  Authentication authentication) {
		
		PopularVO vo = new PopularVO();
		vo.setStDate(stDate);
		vo.setEnDate(enDate);
		vo = service.getPopular(vo, authentication);
		return vo;
	}

}
