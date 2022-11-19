package com.celebback.fr.trade.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.celebback.fr.trade.dao.TradeDAO;
import com.celebback.fr.trade.service.TradeService;
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
 * 2022. 8. 24.      황단비		 기능추가
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/fr/tradeReq")
public class TradeReqRetrieveController {
	@Inject
	TradeService service;
	@Inject
	TradeDAO tradeDAO;
	
	/**
	 * 단순 조회
	 */
	@ModelAttribute("reqList")
	public List<TradeVO> reqList(
			Model model
			,Authentication authentication
			){
		String authName = authentication.getName();
		return tradeDAO.selectTradeReqList(authName);
	}
	
	/**
	 * 단순 조회
	 */	
	@ModelAttribute("respList")
	public List<TradeVO> respList(
			Model model
			,Authentication authentication
			){
		String authName = authentication.getName();
		return tradeDAO.selectTradeRespList(authName);
	}
	
	// =========================================================
	
	@GetMapping
	public String tradeReqList() {
		return "fr/trade/tradeReqList";
	}
	
	/**
	 * 트레이딩 요청 수락
	 * @param tradeVO
	 * @param authentication
	 * @return
	 */
	@PutMapping("/accept")
	public String acceptTrade(
			TradeVO tradeVO
			,Authentication authentication
			) {
		tradeVO.setAuthName(authentication.getName());
		service.mergeTradeAccept(tradeVO);
		
		return "redirect:/fr/tradeReq";
	}
	
	/**
	 * 트레이딩 요청 거절 
	 * @param tradeNo
	 * @return
	 */
	@PutMapping("/reject")
	public String rejectTrade(
			TradeVO tradeVO
			,@RequestParam("tradeNo") String tradeNo
			,@RequestParam(value="tradeNote",required=false) String tradeNote
			) {
		tradeDAO.updateTradeReject(tradeVO);
		return "redirect:/fr/tradeReq";
	}
	
	/**
	 * 트레이딩 요청 취소
	 * @param tradeNo
	 * @return
	 */
	@DeleteMapping("/cancle")
	public String cancleTrade(
			@RequestParam("tradeNo") String tradeNo
			) {
		tradeDAO.deleteTrade(tradeNo);
		
		return "redirect:/fr/tradeReq";
	}
}
