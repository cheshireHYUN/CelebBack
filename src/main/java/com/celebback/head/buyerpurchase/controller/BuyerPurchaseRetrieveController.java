package com.celebback.head.buyerpurchase.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.celebback.head.buyerpurchase.service.BuyerPurchaseService;
import com.celebback.vo.FrOrderVO;
import com.celebback.vo.HeadinVO;
import com.celebback.vo.PagingVO;

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
@RequestMapping("/head/buyerPurchase")
public class BuyerPurchaseRetrieveController {
	
	@Inject
	BuyerPurchaseService service;
	
	// 동기방식 거래처 매입내역 조회
	@GetMapping
	public String buyerPurchaseList(
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage
			, HeadinVO detailCondition
			, Model model
	) {
		PagingVO<HeadinVO> pagingVO = new PagingVO<>(10,3);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setDetailCondition(detailCondition);
		
		service.retrieveBuyerPurchaseList(pagingVO);
		model.addAttribute("pagingVO", pagingVO);		
		
		List<HeadinVO> optionList = service.retrieveOptionList();
		model.addAttribute("optionList", optionList);
		
		
		return "head/buyer/buyerPurchaseList";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String buyerOptionList(
			@RequestParam(name="buyerId", required=false) String buyerId,
			@RequestParam(name="buyerprodId", required=false) String buyerprodId,
			Model model
			) {
		
		List<HeadinVO> optionList2 = service.retrieveOptionList2(buyerId);
		model.addAttribute("optionList2", optionList2);
		
		Integer price = service.retrieveBuyerprodPrice(buyerprodId);
		model.addAttribute("price", price);
		
		return "jsonView";
	}
	
	
	
/*	// 그냥 조회(옵션용)
	@GetMapping
	public void buyerPurchaseList(Model model)
	{
		List<HeadinVO> optionList = service.retrieveOptionList();
		model.addAttribute("optionList", optionList);
		
	}*/
	

}