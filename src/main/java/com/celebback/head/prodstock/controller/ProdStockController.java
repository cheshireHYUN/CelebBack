package com.celebback.head.prodstock.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.celebback.head.prodstock.service.ProdStockService;
import com.celebback.vo.HStockVO;
import com.celebback.vo.PagingVO;
import com.celebback.vo.ProdHeadOutDetailVO;

/**
 * 
 * @author 서재원
 * @since 2022. 8. 6.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 6.   서재원                    최초작성
 * 2022. 9. 8.   서재원                    부족재고 조회
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Controller
@RequestMapping("/head/prodStock")
public class ProdStockController {
	
	@Inject
	ProdStockService service;
	
	@GetMapping
	public String prodStockList(
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage
			, @RequestParam(name="hstockQty", required=false) String hstockQty
			, Model model
			, @ModelAttribute("detailCondition") HStockVO detailCondition
			) {
		
		PagingVO<HStockVO> pagingVO = new PagingVO<>(7,3);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setDetailCondition(detailCondition);
		
		service.retrieveProdStockList(pagingVO);
		model.addAttribute("pagingVO", pagingVO);	
		
		return "head/prodStock/prodStockList";
	}
	
	// 상세조회
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<ProdHeadOutDetailVO> prodStockDetail(
			@RequestParam(name="buyerprodId") String buyerprodId,
			Model model
			) {
		
		List<ProdHeadOutDetailVO> detail = service.retrieveProdStockDetail(buyerprodId);
		model.addAttribute("detail", detail);
		
		return detail;
	}
}
