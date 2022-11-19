package com.celebback.fr.frOrder.controller;

import java.security.Principal;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.celebback.fr.frOrder.service.FrOrderService;
import com.celebback.vo.FrOrderVO;
import com.celebback.vo.PagingVO;
import com.celebback.vo.SimpleSearchCondition;

@Controller
@RequestMapping("/fr/frOrder/updateOrderList")
public class ProdOrderUpdateController {

	@Inject
	FrOrderService service;
	
	@GetMapping
	public String prodOrderUpdateList(
	) {
		return "fr/frOrder/orderUpdateList";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String proccessJsonData(
			Principal principal
			,Model model
			,@RequestParam(value="searchType",required=false) String searchType
			,@RequestParam(value="searchWord",required=false) String searchWord
		) {
		System.out.println("dfdsdf");
		String authName = principal.getName();
		System.out.println(authName);
		SimpleSearchCondition searchVO = new SimpleSearchCondition(searchType, searchWord);
		
		PagingVO<FrOrderVO> pagingVO = new PagingVO<FrOrderVO>();
		
		pagingVO.setSimpleCondition(searchVO);
		pagingVO.setAuthName(authName);
		
//		service.modifyOrderList(pagingVO);
		
		model.addAttribute("orderUpdate", pagingVO);
		
		return "jsonView";
		
	}
}