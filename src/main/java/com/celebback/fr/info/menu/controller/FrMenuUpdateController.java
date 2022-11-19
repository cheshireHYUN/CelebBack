package com.celebback.fr.info.menu.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.celebback.fr.info.menu.service.FrMenuService;
import com.celebback.vo.FrMenuVO;


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
@RestController //RequestBody+Controller, HTTP의 JSON을 VO에 자동 매핑
@RequestMapping("/fr/info/menu")
public class FrMenuUpdateController {
	
	private static final Logger logger = LoggerFactory.getLogger(FrMenuUpdateController.class);

	@Inject
	private FrMenuService service;
	
	@PostMapping("/menuList")
	public ResponseEntity<String> MenuForm(@RequestBody FrMenuVO vo, Authentication authentication) {
		
		ResponseEntity<String> entity = null;
		
		try {
				service.frMenuUpdate(vo,authentication);
				entity = new ResponseEntity<String>("success",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
