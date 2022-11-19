package com.celebback.fr.info.menu.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.celebback.fr.info.menu.service.FrMenuService;

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
@RequestMapping("/fr/info/menu")
public class FrMenuRetrieveController {
	
	private static final Logger logger = LoggerFactory.getLogger(FrMenuRetrieveController.class);
	
	@Inject 
	FrMenuService service;
	
	@GetMapping("/menuList")
	public String MenuList(Model model, Authentication authentication) throws Exception {
		
		model.addAttribute("menuList",service.menuList(authentication));
		model.addAttribute("frMenuList",service.frMenuList(authentication));
		
		return "fr/info/menu/menuList";
	}

}
