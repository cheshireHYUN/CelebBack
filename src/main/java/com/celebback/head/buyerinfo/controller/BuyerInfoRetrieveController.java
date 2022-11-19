package com.celebback.head.buyerinfo.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.celebback.head.buyerinfo.service.BuyerInfoService;
import com.celebback.vo.BuyerVO;
import com.celebback.vo.PagingVO;

/**
 * 
 * @author 서재원
 * @since 2022. 8. 12.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 12.     서재원           최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Controller
@RequestMapping("/head/buyerInfo")
public class BuyerInfoRetrieveController {
	
	@Inject
	BuyerInfoService service;
	
	// 동기방식 거래처 조회 및 검색
	@GetMapping
	public String buyerInfoList(
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage
			, BuyerVO detailCondition
			, Model model
	) {
		
		PagingVO<BuyerVO> pagingVO = new PagingVO<>(7,3);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setDetailCondition(detailCondition);
		
		service.retrieveBuyerInfoList(pagingVO);
		model.addAttribute("pagingVO", pagingVO);			
		
		return "head/buyer/buyerInfoList";
		
	}
	


}
