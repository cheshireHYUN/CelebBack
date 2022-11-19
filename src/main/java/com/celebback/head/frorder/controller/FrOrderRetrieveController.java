package com.celebback.head.frorder.controller;

import java.util.List;

import javax.inject.Inject;
import javax.validation.ReportAsSingleViolation;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.celebback.head.frorder.service.FrOrderService;
import com.celebback.vo.BuyerVO;
import com.celebback.vo.FrOrderVO;
import com.celebback.vo.HStockVO;
import com.celebback.vo.PagingVO;

/**
 * 
 * @author 서재원
 * @since 2022. 8. 20.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 20.         서재원             최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Controller
@RequestMapping("/head/frOrder")
public class FrOrderRetrieveController {
	
	@Inject
	FrOrderService service;
	
	@GetMapping
	public String frOrderList(
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage
			, @RequestParam(name="frOrderState", required=false) String frOrderState
			, Model model
			, @ModelAttribute("detailCondition") FrOrderVO detailCondition
			) {
		
		PagingVO<FrOrderVO> pagingVO = new PagingVO<>(7,3);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setDetailCondition(detailCondition);
		
		service.retrieveFrOrderList(pagingVO);
		model.addAttribute("pagingVO", pagingVO);	
		
		int ST09Count = service.retrieveST09Count();
		model.addAttribute("ST09Count", ST09Count);
		
		return "head/frOrder/frOrderList";
	}
	
//	상세조회
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<FrOrderVO> frOrderDetail(
			@RequestParam(name="frOrderNo") String frOrderNo,
			Model model
			) {
		
		List<FrOrderVO> detail = service.retrieveFrOrderDetail(frOrderNo);
		model.addAttribute("detail", detail);
		
		return detail;
	}
	
	
	@PostMapping
	@ResponseBody
	public String shipping() {
		service.headoutAll();
		return "success";
	}
	
	// AJAX를 이용하면 리턴값이 없어도 (뒤에 DB 로직만 처리하더라도) 반드시 리턴값이 있어야한다. 안그러면 error 발생한다.
	

}
