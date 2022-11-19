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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.celebback.fr.atOrder.service.AtOrderService;
import com.celebback.fr.frOrder.service.FrOrderService;
import com.celebback.vo.FrOrderVO;

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
@RequestMapping("/fr/frOrder/confirmOrder")
public class OrderConfirmCreateController {
	@Inject
	FrOrderService service;
	
	@PostMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String orderConfirm(
		Principal principal
		,@RequestBody Map<String, String> frParam
		, Model model
	) {
		
		FrOrderVO vo = new FrOrderVO();
		// frOrderNo 파라미터 받기
		String frOrderNo = (String)frParam.get("frOrderNo");
		
		// franId 받기
		String authName = principal.getName();
		String franId = service.retrieveFranId(authName);
		
		vo.setFrOrderNo(frOrderNo);
		vo.setFranId(franId);
		
		// insert할 값 select 해오기
		List<FrOrderVO> confirmNum = service.retrieveConfirmOrder(vo);
		
		for (FrOrderVO confirmList : confirmNum) {
			confirmList.setFrOrderNo(frOrderNo);
			service.createConfirmOrder(confirmList);
//			service.modifyConfirmOrder(confirmList);
//			service.modifyFrStockOrder(confirmList);
			
		}
		
		return "jsonView";
	}

}
