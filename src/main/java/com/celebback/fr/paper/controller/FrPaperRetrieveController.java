package com.celebback.fr.paper.controller;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.celebback.fr.paper.service.FrPaperService;
import com.celebback.vo.FrPaperVO;
import com.celebback.vo.PagingVO;
import com.celebback.vo.PaperVO;
import com.celebback.vo.SimpleSearchCondition;
import com.celebback.vo.UserVO;

import lombok.extern.slf4j.Slf4j;
/**
 * 
 * @author 황단비
 * @since 2022. 8. 17.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자            수정내용
 * --------     --------    ----------------------
 * 2022. 8. 17.       황단비      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/fr/paper")
@Slf4j
public class FrPaperRetrieveController {
	@Inject
	FrPaperService service;

	@GetMapping
	public String paperRetrieve() {
//		log.info("이거:"+authentication.getName());
		return "fr/paper/paperList";
	}
	
	/**
	 * 공문수신함 전체조회 json
	 * @param model
	 * @param searchType
	 * @param searchWord
	 * @param currentPage
	 * @return
	 */
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String proccessJsonData(
			Model model
			,@RequestParam(value="searchType",required=false) String searchType // searchType파라미터가 필요한데 꼭 필요한건 아니야
			,@RequestParam(value="searchWord",required=false)String searchWord
			,@RequestParam(value="page",required=false, defaultValue="1") int currentPage
			,Authentication authentication
			) {

		SimpleSearchCondition searchVO = new SimpleSearchCondition(searchType, searchWord);
		
//		log.info("searchType : {}, searchWord : {}",searchType,searchWord); // info로 설정했기 때문에 그 이상의 등급을 사용해야 콘솔에 출력됨.
					// 메세지 포맷팅 가능

		PagingVO<FrPaperVO> pagingVO = new PagingVO<FrPaperVO>(5,3);
		
		pagingVO.setCurrentPage(currentPage); //sp ep sr er가 결정됨
		pagingVO.setSimpleCondition(searchVO);
		
		pagingVO.setAuthName(authentication.getName());
		
		service.retrieveFrPaperList(pagingVO);
		
		model.addAttribute("frPaper", pagingVO);
		
		return  "jsonView";
	}
	
	@GetMapping(value="/{paperSn}")
	public String frPaperDetailRetrieve(
			@PathVariable int paperSn
			,Model model
			) {
		service.retrieveFrPaper(paperSn);
//		PaperVO detail = service.retrievePaper(paperId);
//		model.addAttribute("paper",detail);
		
		return "fr/paper/paperView";
	}
}
