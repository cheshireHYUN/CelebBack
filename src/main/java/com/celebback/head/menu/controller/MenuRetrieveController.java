package com.celebback.head.menu.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.celebback.head.menu.service.MenuService;
import com.celebback.vo.MenuVO;

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
@RequestMapping("/head/menu")
public class MenuRetrieveController {
	
	private static final Logger logger = LoggerFactory.getLogger(MenuRetrieveController.class);
	
	@Inject
	private MenuService service;
	
	@GetMapping
	public String menuList() throws Exception {
		return "head/menu/menuList";
	}

	@ResponseBody
	@GetMapping("/list")
	public List<MenuVO> menuListJson() throws Exception {
		
		List<MenuVO> list = null;
		list = service.retrieveMenuList();
		System.out.println(list);
		return list;
	}

}
