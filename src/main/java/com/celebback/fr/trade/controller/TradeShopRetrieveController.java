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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.celebback.fr.trade.dao.TradeDAO;
import com.celebback.fr.trade.service.TradeService;
import com.celebback.head.fr.dao.FrDAO;
import com.celebback.vo.FranVO;
import com.celebback.vo.PagingVO;
import com.celebback.vo.ProfitVO;
import com.celebback.vo.SimpleSearchCondition;
import com.celebback.vo.TradeVO;

import lombok.extern.slf4j.Slf4j;

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
 * 2022. 8. 23.		 황단비		 기능추가
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Controller
@RequestMapping("/fr/tradeShop")
public class TradeShopRetrieveController {
	@Inject
	TradeService service;
	@Inject
	TradeDAO tradeDAO;
	
	@ModelAttribute("foodList")
	public List<Map<String, Object>> retrieveFranName(){
		return tradeDAO.selectFoodList();
	}
	
	/**
	 * 트레이딩 매장조회
	 * @return
	 */
	@GetMapping
	public String tradeShopList() {
		return "fr/trade/tradeShopList";
	}

	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String proccessJsonData(
			Model model
			,@RequestParam(value="searchWord",required=false)String searchWord
			,@RequestParam(value="searchWord2",required=false)Integer searchWord2
			,@RequestParam(value="page",required=false, defaultValue="1") int currentPage
			,Authentication authentication
			) {
		SimpleSearchCondition searchVO = new SimpleSearchCondition(searchWord, searchWord2);
		
		PagingVO<TradeVO> pagingVO = new PagingVO<TradeVO>(5,3);
		
		pagingVO.setCurrentPage(currentPage); //sp ep sr er가 결정됨
		pagingVO.setSimpleCondition(searchVO);
		pagingVO.setAuthName(authentication.getName());

		List<FranVO> map = tradeDAO.selectMap(pagingVO);
		model.addAttribute(map);

		if(searchWord!="") {
			service.retrieveTradeSearch(pagingVO);
			model.addAttribute("trade", pagingVO);
		}else {
			pagingVO.setDataList(null);
			model.addAttribute("trade", pagingVO);
		}
		return  "jsonView";
	}

	/**
	 * 트레이딩 매장조회 - 트레이딩 요청
	 * @return
	 */
	@PostMapping
	public String sendTrade(
			TradeVO tradeVO
			,Authentication authentication
			) {
//		log.info("!!!!!!"+franName);
		tradeVO.setAuthName(authentication.getName());
		tradeDAO.insertTrade(tradeVO);
		return "redirect:/fr/tradeReq";
	}
}
