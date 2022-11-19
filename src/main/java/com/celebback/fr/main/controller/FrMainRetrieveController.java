package com.celebback.fr.main.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.celebback.fr.main.dao.FrMainDAO;
import com.celebback.fr.main.service.FrMainService;
import com.celebback.head.frcheck.dao.frCheckDAO;
import com.celebback.head.paper.dao.PaperDAO;
import com.celebback.vo.CheckingVO;
import com.celebback.vo.EduSchVO;
import com.celebback.vo.PaperVO;
import com.celebback.vo.ResvVO;
import com.celebback.vo.TradeVO;

import lombok.extern.slf4j.Slf4j;
/**
 * 
 * @author 황단비
 * @since 2022. 8. 2.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자            수정내용
 * --------     --------    ----------------------
 * 2022. 8. 2.       황단비      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Controller
@Slf4j
public class FrMainRetrieveController {
	@Inject
	FrMainService service;
	
	@Inject
	FrMainDAO frMainDAO;
	@Inject
	PaperDAO paperDAO;
	@Inject
	frCheckDAO frchkDAO;
	
	@ModelAttribute("paperList")
	public List<PaperVO> retrievePaperList(
			Authentication authentication) {
		String authName = authentication.getName();
		List<PaperVO> result = paperDAO.selectPaperListMain(authName);
//		log.info("!!!!!!"+result.get(0).getFrPaper().get(0).getPaperDate());
		return result;
	}
	
	@ModelAttribute("chkList")
	public List<CheckingVO> retrieveChkingList(
			Authentication authentication) {
		String authName = authentication.getName();
		return frchkDAO.selectfrMainCheckList(authName);
	}
	
	@ModelAttribute("eduList")
	public List<EduSchVO> retrieveEduList(
			Authentication authentication) {
		String authName = authentication.getName();
		List<EduSchVO> result = frMainDAO.selectEduList(authName);
		for(EduSchVO edu:result) {
			String eduDate = edu.getEduDate().substring(0,10);
			edu.setEduDate(eduDate);
		}
		return result;
	}
	
	@ModelAttribute("tradeList")
	public List<TradeVO> retrieveTradeList(
			Authentication authentication) {
		String authName = authentication.getName();
		List<TradeVO> result = frMainDAO.selectTodayTradeList(authName);
		return result;
	}
	
	@ModelAttribute("resvList")
	public List<ResvVO> retrieveResvList(
			Authentication authentication) {
		String authName = authentication.getName();
		List<ResvVO> result = frMainDAO.selectDayResvList(authName);
		//log.info("!!!!!"+result.get(0).getMem().getMemName());
		return result;
	}
	
	@ModelAttribute("franName")
	public String retrieveFranName(
			Authentication authentication
	) {
		String ownerId = authentication.getName();
		String franName = frMainDAO.selectFranName(ownerId);
		return franName;
	}
	
	
	
	@RequestMapping("/fr")
	public String frIndex(){
		return "fr";
	}
	
	
}
