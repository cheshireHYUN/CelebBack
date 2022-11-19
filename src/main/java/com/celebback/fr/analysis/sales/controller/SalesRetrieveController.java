package com.celebback.fr.analysis.sales.controller;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.celebback.fr.analysis.sales.dao.SalesDao;
import com.celebback.head.frPayment.dao.FrPaymentDAO;
import com.celebback.vo.ProfitVO;
import com.celebback.vo.SimpleSearchCondition;

/**
 * 
 * @author 최서현
 * @since 2022. 8. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 5.       최서현      최초작성
 * 2022. 9  6.       황단비		 기능추가
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/fr/analysis/sales/list")
public class SalesRetrieveController {
	
	@Inject
	FrPaymentDAO frPaymentDAO;
	
	@GetMapping
	public String salesList() {
		return "fr/analysis/sales/salesList";
	}
	
	@PostMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String proccessJsonData(
			Model model
			,@RequestParam(value="searchType",required=false) String searchType // searchType파라미터가 필요한데 꼭 필요한건 아니야
			,@RequestParam(value="searchWord",required=false)String searchWord
			,@RequestParam(value="searchStartDate",required=false)String searchStartDate // 년도
			,@RequestParam(value="searchEndDate",required=false)String searchEndDate // 월
			,ProfitVO prof
			,Authentication authentication
			) {
		
		searchWord = authentication.getName();
		SimpleSearchCondition searchVO = new SimpleSearchCondition(searchStartDate,searchEndDate,searchType, searchWord);
		prof.setSimpleCondition(searchVO);
		
		if(searchVO.getSearchWord()!="") {
			Map<String, Object> chart=frPaymentDAO.selectOwnerChart(prof);
			prof = frPaymentDAO.selectOwnerSales(prof);
			model.addAttribute("prof",prof);
			model.addAttribute("chart",chart);
		}
		
		return  "jsonView";
	}
}
