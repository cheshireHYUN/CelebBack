package com.celebback.fr.frOrder.controller;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.celebback.fr.frOrder.service.FrOrderService;
import com.celebback.vo.FrOrderVO;
import com.celebback.vo.FrStockVO;
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
 * 2022. 8. 5.       이혜원      최초작성R
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Controller
@RequestMapping("/fr/frOrder/orderList")
public class OrderRetrieveController {
	@Inject
	FrOrderService service;
	
	@GetMapping
	public String orderList(
			Principal principal
	) {
		String franId = principal.getName();
		return "fr/frOrder/orderList";
	}
	
	
	/**
	 * 발주내역 조회 json
	 * @param model
	 * @param searchType
	 * @param searchWord
	 * @param currentPage
	 * @param searchStartDate
	 * @param searchEndDate
	 * @return
	 */
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String proccessJsonData(
			Principal principal
			,Model model
			,@RequestParam(value="searchType",required=false) String searchType
			,@RequestParam(value="searchWord",required=false) String searchWord
			,@RequestParam(value="page",required=false, defaultValue="1") int currentPage
			,@RequestParam(value="searchStartDate",required=false) String searchStartDate
			,@RequestParam(value="searchEndDate",required=false) String searchEndDate
	) {
		
		String authName = principal.getName();
		String franId = service.retrieveFranId(authName);
		
		SimpleSearchCondition searchVO = new SimpleSearchCondition(searchStartDate, searchEndDate, searchType, searchWord);
		
		PagingVO<FrOrderVO> pagingVO = new PagingVO<FrOrderVO>(7,3);
		
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(searchVO);
		pagingVO.setFranId(franId);
		
		service.retrieveOrderList(pagingVO);
		
		model.addAttribute("frOrder", pagingVO);
		
		return "jsonView";
		
	}
	
	/**
	 * 발주내역 상세조회
	 * @param frOrderNo
	 * @param model
	 * @return
	 */
	@PostMapping(value="/{frOrderNo}", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String orderDetail(
			@PathVariable String frOrderNo
			, Model model
	) {
		List<FrOrderVO> order = service.retrieveOrder(frOrderNo);
		model.addAttribute("orderDetail", order);
		return "jsonView";
	}
	

}
