package com.celebback.fr.frOrder.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.celebback.fr.frOrder.service.FrOrderService;

@Controller
@RequestMapping("/fr/frOrder/deleteOrder")
public class OrderDeleteController {

	@Inject
	FrOrderService service;
	
	@PostMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String orderDelete(
		@RequestBody Map<String, String> frParam
	) {
		System.out.println(frParam);
		
		String frOrderNo = (String)frParam.get("frOrderNo");
		
		service.deleteOrder(frOrderNo);
		
		return "jsonView";
	}
	
//	성공시 페이지 이동 메서드
	@GetMapping(value="/success")
	public String successDelete() {
		return "fr/frOrder/orderList";
	}
	
	
}
