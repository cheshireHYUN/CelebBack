package com.celebback.fr.pay.bill.controller;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.celebback.fr.frOrder.service.FrOrderService;
import com.celebback.fr.pay.bill.service.BillService;
import com.celebback.vo.BillVO;

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
@RequestMapping("/fr/pay/bill")
public class BillRetrieveController {
	
	@Inject
	BillService service;
	
	// franId 가져오기 위한 service
	@Inject
	FrOrderService orderService;
	
	
	@GetMapping("/list")
	public String getBillList(
	) {
		return "fr/pay/bill/billList";
		
	}
	
	// 공과금 차트 조회/수정
	@ResponseBody 
	@PostMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE, value="/chartList")
	public List<BillVO> chartList(
		@RequestBody BillVO vo,
		Principal principal
		, Model model
	
	) {
		String authName = principal.getName();
		String franId = orderService.retrieveFranId(authName);
		vo.setFranId(franId);
		List<BillVO> updateList = service.retrieveBillList(vo);
		return updateList;
	}
	
	@ResponseBody 
	@PostMapping("/list")
	public BillVO postBillList(@RequestBody BillVO vo,  Authentication authentication) {
		return service.billList(vo, authentication);
	}
	
	@ResponseBody
	@PostMapping("/save") 
	public ResponseEntity<String> billCreate(@RequestBody BillVO vo,  Authentication authentication) {
		ResponseEntity<String> entity = null;
		try {
			service.billCreate(vo, authentication);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	@ResponseBody
	@PostMapping("/update")
	public ResponseEntity<String> billUpdate(@RequestBody BillVO vo) {
		ResponseEntity<String> entity = null;
		
		try {
			service.billUpdate(vo);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
