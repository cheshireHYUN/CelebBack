package com.celebback.board.notice.controller;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.celebback.board.notice.service.NoticeService;
import com.celebback.vo.NoticeVO;
import com.celebback.vo.PagingVO;
import com.celebback.vo.SimpleSearchCondition;

import lombok.extern.slf4j.Slf4j;

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
@Slf4j
@Controller
@RequestMapping("/head/Notice")
public class HeadNoticeRetrieveController {
	
	@Inject
	NoticeService service;
	
	@GetMapping
	public String NoticeList(
//			@ModelAttribute("notice") NoticeVO notice,
//			SessionStatus sessionStatus
	) {
//		sessionStatus.setComplete();
		return "head/board/noticeList";
	}
	
	@GetMapping("{postNo}")
	public String NoticeDetail(
			@PathVariable("postNo") String postNo
			, Model model
	) {
		NoticeVO notice = service.retrieveNotice(postNo);
		model.addAttribute("notice", notice);
		return "head/board/noticeDetail";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String proccessJsonData(
			Model model
			,@RequestParam(value="searchStartDate",required=false) String searchStartDate
			,@RequestParam(value="searchEndDate",required=false) String searchEndDate
			,@RequestParam(value="searchType",required=false) String searchType
			,@RequestParam(value="searchWord",required=false) String searchWord
			,@RequestParam(value="page",required=false, defaultValue="1") int currentPage
			) {

		SimpleSearchCondition searchVO = new SimpleSearchCondition(searchStartDate, searchEndDate, searchType, searchWord);

		PagingVO<NoticeVO> pagingVO = new PagingVO<NoticeVO>(10,5);
		
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(searchVO);
		
		service.retrieveNoticeList(pagingVO);
		
		model.addAttribute("notice", pagingVO);
		
		return  "jsonView";
	}
}
