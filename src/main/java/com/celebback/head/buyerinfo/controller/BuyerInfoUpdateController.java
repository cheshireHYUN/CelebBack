package com.celebback.head.buyerinfo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.celebback.head.buyerinfo.service.BuyerInfoService;
import com.celebback.vo.BuyerVO;
import com.celebback.vo.PagingVO;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 서재원
 * @since 2022. 8. 17.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 17.         서재원             최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Controller
@RequestMapping("/head/buyerInfo")
@Slf4j
public class BuyerInfoUpdateController {

	@Inject
	BuyerInfoService service;
	
	@ResponseBody
	@PostMapping
	public void buyerInfoUpdate(
			@RequestParam(name="column") String column,
			@RequestParam(name="modifyValue") String modifyValue,
			@RequestParam(name="buyerId") String buyerId
			, Model model
	) {
		
		log.info("----업데이트 컨트롤러에서 데이터 받아오기----");
		log.info(column);		
		log.info(buyerId);
		log.info(modifyValue);
		log.info("----업데이트 컨트롤러에서 데이터 받아오기 끝----");
		
		List<String> columnInfoList = new ArrayList<>();
		columnInfoList.add("BUYER_ID");
		columnInfoList.add("BUYER_NAME");
		columnInfoList.add("BUYER_TEL");
		columnInfoList.add("BUYER_ADD");
		columnInfoList.add("BUYER_CHARGER");
		columnInfoList.add("BUYER_MAIL");
		
		if(columnInfoList.contains(column)) {
			Map<String, String> map = new HashMap<>();
			map.put("column", column);
			map.put("modifyValue", modifyValue);
			map.put("buyerId", buyerId);
			service.updateBuyerInfo(map);
		}
	}
	
}
