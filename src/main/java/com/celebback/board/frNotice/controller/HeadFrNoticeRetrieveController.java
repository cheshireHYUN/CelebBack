package com.celebback.board.frNotice.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.celebback.board.frNotice.dao.FrNoticeDAO;
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
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/head/frNotice")
public class HeadFrNoticeRetrieveController {
	
	@Inject
	FrNoticeService service;
	
	@Inject
	FrNoticeDAO frNoticeDao;
	
	@ModelAttribute("franNameList")
	public List<Map<String, String>> franNameList(){
		return frNoticeDao.selectFranNameList();
	}
	
	@GetMapping
	public String frNoticeList() {
		return "head/board/frNoticeList";
	}
	
	@GetMapping("{frannoticeNo}")
	public String frNoticeDetail(
			@PathVariable("frannoticeNo") int frannoticeNo
			, Model model
	) {
		FrNoticeVO frNotice = service.retrieveFrNoticeForHead(frannoticeNo);
		model.addAttribute("frNotice", frNotice);
		return "head/board/frNoticeDetail";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String proccessJsonData(
			Authentication authentication
			, Model model
			, @RequestParam(value="searchStartDate",required=false) String searchStartDate
			, @RequestParam(value="searchEndDate",required=false) String searchEndDate
			, @RequestParam(value="searchFranName",required=false) String searchFranName
			, @RequestParam(value="searchType",required=false) String searchType
			, @RequestParam(value="searchWord",required=false) String searchWord
			, @RequestParam(value="page",required=false, defaultValue="1") int currentPage
			) {

		SimpleSearchCondition searchVO = new SimpleSearchCondition(searchStartDate, searchEndDate, searchFranName, searchType, searchWord);

		PagingVO<FrNoticeVO> pagingVO = new PagingVO<FrNoticeVO>(10,5);
		
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(searchVO);
		
		service.retrieveFrNoticeListForHead(pagingVO);
		
		model.addAttribute("frNotice", pagingVO);
		
		return  "jsonView";
	}
}
