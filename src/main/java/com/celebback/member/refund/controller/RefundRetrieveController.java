package com.celebback.member.refund.controller;

import java.io.IOException;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.celebback.member.refund.dao.RefundDAO;
import com.celebback.member.refund.service.RefundService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;
/**
 * 
 * @author 황단비
 * @since 2022. 8. 30.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자            수정내용
 * --------     --------    ----------------------
 * 2022. 8. 30.       황단비      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Controller
@RequestMapping("/mypage/refund")
public class RefundRetrieveController {
	@Inject
	RefundDAO refundDAO;
	@Inject
	RefundService service;
	
//	5396366384017153
//	483b3abedb0f4e219f1fe9528a7fe23131a03914c61ecc767f0886e618f94e907da270c735dbd609
	
	@PostMapping
	public String refundProcess(
//			@RequestParam(required=false,value="payPg") String payPg
			@RequestParam Map<String, Object> param
			) {
		log.info("param :: {}", param);
		log.info("payPg :: {}", param.get("payPg"));
		
		String payPg = (String) param.get("payPg");
		String resvId = (String) param.get("resvId");
		
		String morderId = "OR"+resvId.substring(2);
		log.info("payPg :: {}", morderId);
		
		if(!"".equals(payPg)) {
			service.refundProcess(payPg,resvId);
	    }else {
	    	refundDAO.updateReserve(morderId);
	    }
		
		return "jsonView";
	}
	
}
