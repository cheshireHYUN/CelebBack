package com.celebback.fr.frStock.controller;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.celebback.fr.frOrder.service.FrOrderService;
import com.celebback.fr.frStock.service.FrStockService;
import com.celebback.vo.FrStockVO;
import com.celebback.vo.FranVO;
import com.celebback.vo.PagingVO;
import com.celebback.vo.SimpleSearchCondition;

/**
 * 
 * @author 이혜원
 * @since 2022. 8. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 5.       이혜원      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Controller
@RequestMapping("/fr/frStock")
public class FrStockRetrieveController {
	@Inject
	FrStockService stockService;
	
	@Inject
	FrOrderService orderService;
	
	@GetMapping
	public String frStockListRetrieve() {
		return "fr/frStock/frStockList";
	}
	
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String proccessJsonData(
			Principal principal
			,Model model
			,@RequestParam(value="searchType",required=false) String searchType
			,@RequestParam(value="searchWord",required=false) String searchWord
			) {
		
		String authName = principal.getName();
		String franId = orderService.retrieveFranId(authName);
		SimpleSearchCondition searchVO = new SimpleSearchCondition(searchType, searchWord);
		
		PagingVO<FrStockVO> pagingVO = new PagingVO<FrStockVO>();
		
		pagingVO.setSimpleCondition(searchVO);
		pagingVO.setFranId(franId);
		
		stockService.retrieveFrStockList(pagingVO);
		
		model.addAttribute("frStock", pagingVO);
		
		return "jsonView";
	}
	
	
}

