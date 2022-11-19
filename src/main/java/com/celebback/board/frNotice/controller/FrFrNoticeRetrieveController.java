package com.celebback.board.frNotice.controller;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.celebback.board.frNotice.service.FrNoticeService;
import com.celebback.vo.FrNoticeVO;
import com.celebback.vo.PagingVO;
import com.celebback.vo.SimpleSearchCondition;

/**
 * @author 정아영
 * @since 2022. 8. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                    수정자              수정내용
 * --------       --------    ----------------------
 * 2022. 8. 5.     정아영              최초작성
 * 2022. 8. 23.    정아영              1차 수정
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/fr/frNotice")
public class FrFrNoticeRetrieveController {

	@Inject
	FrNoticeService service;
	
	@GetMapping
	public String frNoticeList() {
		return "fr/board/frNoticeList";
	}
	
	@GetMapping("{frannoticeNo}")
	public String frNoticeDetail(
			@PathVariable("frannoticeNo") int frannoticeNo
			, Model model
	) {
		FrNoticeVO frNotice = service.retrieveFrNotice(frannoticeNo);
		model.addAttribute("frNotice", frNotice);
		return "fr/board/frNoticeDetail";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String proccessJsonData(
			Authentication authentication
			, Model model
			, @RequestParam(value="searchStartDate",required=false) String searchStartDate
			, @RequestParam(value="searchEndDate",required=false) String searchEndDate
			, @RequestParam(value="searchType",required=false) String searchType
			, @RequestParam(value="searchWord",required=false) String searchWord
			, @RequestParam(value="page",required=false, defaultValue="1") int currentPage
			) {

		String ownerId = authentication.getName();
		String franId = service.retrieveFranId(ownerId);
		
		SimpleSearchCondition searchVO = new SimpleSearchCondition(searchStartDate, searchEndDate, searchType, searchWord);

		PagingVO<FrNoticeVO> pagingVO = new PagingVO<FrNoticeVO>(10,5);
		
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(searchVO);
		pagingVO.setFranId(franId);
		
		service.retrieveFrNoticeList(pagingVO);
		
		model.addAttribute("frNotice", pagingVO);
		
		return  "jsonView";
	}
}
