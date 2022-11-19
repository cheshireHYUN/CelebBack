package com.celebback.fr.frOrder.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.celebback.fr.frOrder.service.FrOrderService;
import com.celebback.vo.FrOrderVO;

import oracle.jdbc.proxy.annotation.Post;

/**
 * 
 * @author 이혜원
 * @since 2022. 8. 6.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 6.       이혜원      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Controller
@RequestMapping("/fr/frOrder/insertOrder")
public class OrderCreateController {
	
	@Inject
	FrOrderService service;
	
	@GetMapping(value="/success")
	public String orderInsert(
			Model model
	) {
		// frOrderNo 구하기
		String frOrderNo = service.retrieveOrderNo();
		System.out.println(frOrderNo);
		
		FrOrderVO vo = new FrOrderVO();
		vo.setFrOrderNo(frOrderNo);
		
		FrOrderVO scOrderList = service.retrieveScOrder(vo);
		model.addAttribute("scOrderList", scOrderList);
		System.out.println(scOrderList);
		return "fr/frOrder/orderSuccess";
	}
	
	@PostMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String proccessJsonData(
			Principal principal
			,@RequestBody List<Map<String, Object>> list
			,Model model
	) {
		// frOrderPrice 빼서 치환작업
		Map<String, Object> mapPrice = list.get(0);
		String frOrderPrice = (String) mapPrice.get("frOrderPrice");
		String reFrOrderPrice = frOrderPrice.replaceAll(",", "");	
		
		// franId 구하기
		String authName = principal.getName(); 
		String franId = service.retrieveFranId(authName);
		
		// vo에서 map(frOrderPrice) 제거
		FrOrderVO vo = new FrOrderVO();
		vo.setFranId(franId);
		vo.setFrOrderPrice(reFrOrderPrice);
		list.remove(0);
		
		vo.setDtList(list);
		service.createOrder(vo);
		
		return "jsonView";
		
	}

}
