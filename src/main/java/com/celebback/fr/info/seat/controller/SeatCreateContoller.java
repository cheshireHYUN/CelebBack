package com.celebback.fr.info.seat.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.celebback.fr.info.seat.service.SeatService;


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
@RequestMapping("/fr/info/seat")
public class SeatCreateContoller {
	
	@Inject
	SeatService service;
	
	@PostMapping("/seatForm")
	@ResponseBody
	public ResponseEntity<String>  seatForm(@RequestBody String data,  Authentication authentication) {
		
		ResponseEntity<String> entity = null;
		
		try {
			service.createSeat(data, authentication);	
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}