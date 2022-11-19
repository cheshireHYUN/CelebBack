package com.celebback.fr.frStock.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.celebback.fr.frOrder.service.FrOrderService;
import com.celebback.fr.frStock.service.FrStockService;

/**
 * 
 * @author 이혜원
 * @since 2022. 8. 31.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 31.       이혜원      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Controller
@RequestMapping("/fr/frStock/updateFrStock")
public class FrStockUpdateController {
	
	@Inject
	FrStockService stockService;
	
	@Inject
	FrOrderService orderService;
	
	@PostMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String proccessJsonData(
			Principal principal
			,@RequestBody Map<String,List<Integer>> trTagMap
			,Model model
		) {
		System.out.println(trTagMap);
		
		//fran_id 가져오기
		String authName = principal.getName(); 
		String franId = orderService.retrieveFranId(authName);
		
		List<Integer> stockList = trTagMap.get("trTag");
		
		int cnt=1;
		for (Integer stockNum : stockList) {
			System.out.println(stockNum);
			HashMap<String, String> frStockMap = new HashMap<>();
			if( cnt < 10 ) {
				frStockMap.put("buyerProdId","00"+cnt);				
			}else {
				frStockMap.put("buyerProdId","0"+cnt);				
			}
			frStockMap.put("frStockQty",Integer.toString(stockNum));
			frStockMap.put("franId", franId);
			System.out.println(franId);
			cnt++;
			stockService.modifyFrStock(frStockMap);			
			model.addAttribute("frStock", frStockMap);
		}
		
		return "jsonView";
	}
	
	
	
	
	
	
	

}
