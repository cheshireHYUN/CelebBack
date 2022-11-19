package com.celebback.fr.pay.fee.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.celebback.fr.pay.fee.service.FeeService;
import com.celebback.vo.FrFeeDetailVO;
import com.celebback.vo.FrFeeVO;

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
@RequestMapping("/fr/pay/fee")
public class FeeRetrieveController {
	
	@Inject
	FeeService service;
	
	@GetMapping("/list")
	public String feeListGet() {
		
		return "fr/pay/fee/feeList";
	}
	
	@ResponseBody
	@PostMapping("/list")
	public FrFeeVO feeListPost(@RequestBody FrFeeVO vo, Authentication authentication) {
		vo = service.feeList(vo,authentication);
		return vo;
	}
	
	@ResponseBody
	@PostMapping("/listDetail")
	public List<FrFeeDetailVO> feeListDetailPost(@RequestBody FrFeeDetailVO vo, Authentication authentication) {
		List<FrFeeDetailVO> targetList = service.feeDetailList(vo, authentication);
		return targetList;
	}

}
