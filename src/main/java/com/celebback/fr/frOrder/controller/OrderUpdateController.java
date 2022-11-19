package com.celebback.fr.frOrder.controller;

import java.security.Principal;
import java.util.HashMap;
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
import com.celebback.vo.PagingVO;
import com.celebback.vo.SimpleSearchCondition;

/**
 * 
 * @author 이혜원
 * @since 2022. 8. 21.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 21.       이혜원      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Controller
@RequestMapping("/fr/frOrder/updateOrder")
public class OrderUpdateController {
	
	@Inject
	FrOrderService service;
	
	@GetMapping(value="/success")
	public String orderUpdate() {
			return "fr/frOrder/orderList";
	}
	
	@PostMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String proccessJsonDataUpdate(
			Principal principal
			,@RequestBody Map<String, Object> arrChk
			,Model model
		) {
		System.out.println(arrChk);
		
		//security에서 가져온 owner_id 를 가져온다
		String authName = principal.getName(); 
		//owner_id로 fran_id 를 구한다
		String franId = service.retrieveFranId(authName);
		
		Integer dtOrderQty = (Integer)arrChk.get("dtOrderQty");
		String dtOrderPrice = (String)arrChk.get("dtOrderPrice");
		String frOrderPrice = (String)arrChk.get("frOrderPrice");
		
		HashMap<String, Object> frOrderMap = new HashMap<>();
		frOrderMap.put("frOrderPrice", frOrderPrice);
		frOrderMap.put("authName", franId);
		
		HashMap<String, Object> dtOrderMap = new HashMap<>();
		dtOrderMap.put("dtOrderQty", dtOrderQty);
		dtOrderMap.put("dtOrderPrice", dtOrderPrice);
		
//		service.modifyFrOrder(frOrderMap);
//		service.modifyDtOrder(dtOrderMap);
		
//		model.addAttribute("updateOrder", upOrderMap);
		
		return "jsonView";
	
}

}
