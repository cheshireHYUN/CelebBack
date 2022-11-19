package com.celebback.head.buyerpurchase.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.celebback.head.buyerpurchase.service.BuyerPurchaseService;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 서재원
 * @since 2022. 8. 19.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 19.         서재원             최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Controller
@RequestMapping("/head/buyerPurchase")
@Slf4j
public class BuyerPurchaseCreateController {
	
	@Inject
	BuyerPurchaseService service;
	
	@PostMapping
	@ResponseBody
	public void buyerPurchaseCreate(
			@RequestParam(name="buyerprodId") String buyerprodId,
			@RequestParam(name="headinQty") Integer headinQty,
			@RequestParam(name="headinDate") String headinDate,
			@RequestParam(name="headinRelease") String headinRelease
			) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("buyerprodId", buyerprodId);
		map.put("headinQty", (Integer) headinQty);
		map.put("headinDate", headinDate);
		map.put("headinRelease", headinRelease);
		// VO를 만들었는데 굳이 map으로 할 이유가 없긴한데.. 나중에 시간 남으면 리팩토링하자

		log.info("컨트롤러단 시작");
		log.info("{}", map);
		log.info("컨트롤러단 끝");
		
		service.createBuyerPurchase(map);
		// 서비스단을 안불러와서 컨트롤러에서 서비스로 연결이 안됐었다.
		
	}
	

}
