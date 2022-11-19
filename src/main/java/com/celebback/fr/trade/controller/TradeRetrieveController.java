package com.celebback.fr.trade.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.celebback.fr.trade.dao.TradeDAO;
import com.celebback.fr.trade.service.TradeService;
import com.celebback.vo.FranVO;
import com.celebback.vo.PagingVO;
import com.celebback.vo.SimpleSearchCondition;
import com.celebback.vo.TradeVO;

/**
 * 
 * @author 이혜원
 * @since 2022. 8. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자            수정내용
 * --------     --------    ----------------------
 * 2022. 8. 5.       이혜원      최초작성
 * 2022. 8. 25.		 황단비      기능추가
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/fr/trade")
public class TradeRetrieveController {
	@Inject
	TradeService service;
	@Inject
	TradeDAO tradeDAO;
	
	@ModelAttribute("foodList")
	public List<Map<String, Object>> retrieveFranName(){
		return tradeDAO.selectFoodList();
	}
	
	@GetMapping
	public String tradeList() {
		return "fr/trade/tradeList";
	}

	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
//	@ResponseBody //  jsonView말고 responseBody 권장(요즘 많이 씀)
	public String proccessJsonData(
			Model model
			,@RequestParam(value="searchType",required=false) String searchType
			,@RequestParam(value="searchWord",required=false)String searchWord
			,@RequestParam(value="searchSelect",required=false)String searchSelect
			,@RequestParam(value="searchSelect2",required=false)String searchSelect2
			,@RequestParam(value="page",required=false, defaultValue="1") int currentPage
			,Authentication authentication
			) {
		String[] searchSelectArr = searchSelect.split(",");
		String[] searchSelectArr2 = searchSelect2.split(",");
		SimpleSearchCondition searchVO = new SimpleSearchCondition(searchType, searchWord,searchSelectArr,searchSelectArr2);
		
		PagingVO<TradeVO> pagingVO = new PagingVO<TradeVO>(5,5);

		pagingVO.setAuthName(authentication.getName());
		pagingVO.setCurrentPage(currentPage); //sp ep sr er가 결정됨
		pagingVO.setSimpleCondition(searchVO);
		
		service.retrieveTradeList(pagingVO);
		
		model.addAttribute("trade", pagingVO);
		
		return  "jsonView";
//		return  pagingVO; // responseBody 사용시
	}
	
}
