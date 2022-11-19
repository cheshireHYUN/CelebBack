package com.celebback.head.menu.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.celebback.head.menu.service.MenuService;

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
public class MenuDeleteController {
	
	@Inject 
	private MenuService service;
	
	@ResponseBody
	@RequestMapping(value="/{memuId}",method=RequestMethod.DELETE)
	public ResponseEntity<String> menuDelete(@PathVariable("memuId") String menuId) throws Exception {
		ResponseEntity<String> entity = null;
		service.deleteMenu(menuId);
		entity = new ResponseEntity<String>("success",HttpStatus.OK);
		
		return entity;
	}

}
