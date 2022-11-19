package com.celebback.head.frcheck.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.celebback.head.frPayment.dao.FrPaymentDAO;
import com.celebback.head.frcheck.dao.frCheckDAO;
import com.celebback.head.frcheck.service.FrCheckService;
import com.celebback.validate.InsertGroup;
import com.celebback.vo.CheckingVO;
import com.celebback.vo.FranVO;
import com.celebback.vo.PagingVO;
import com.celebback.vo.SimpleSearchCondition;
/**
 * 
 * @author 황단비
 * @since 2022. 8. 8.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자            수정내용
 * --------     --------    ----------------------
 * 2022. 8. 8.       황단비      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/head/frCheck")
public class FrCheckRetrieveController {
	@Inject
	FrCheckService service;
	
	@Inject
	frCheckDAO frCheckDAO;
	
	@Inject
	FrPaymentDAO frPaymentDAO; // 단순 데이터 조회용
	
	@ModelAttribute("franNameList")
	public List<Map<String, Object>> retrieveFranName(){
		return frPaymentDAO.selectFranName();
	}
	
	@ModelAttribute("checking")
	public CheckingVO makeChecking(){
		return new CheckingVO();
	}
	
	@GetMapping
	public String frCheckRetrieve() {
		return "head/frCheck/frCheckList";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String proccessJsonData(
			Model model
			,@RequestParam(value="searchType",required=false) String searchType // searchType파라미터가 필요한데 꼭 필요한건 아니야
			,@RequestParam(value="searchWord",required=false)String searchWord
			,@RequestParam(value="searchSelect",required=false)String searchSelect
			,@RequestParam(value="searchStartDate",required=false)String searchStartDate
			,@RequestParam(value="searchEndDate",required=false)String searchEndDate
			,@RequestParam(value="page",required=false, defaultValue="1") int currentPage
			) {

		String[] searchSelectArr = searchSelect.split(",");
		SimpleSearchCondition searchVO = new SimpleSearchCondition(searchType, searchWord,searchSelect,searchSelectArr,searchStartDate,searchEndDate);
		
//		log.info("searchType : {}, searchWord : {}",searchType,searchWord); // info로 설정했기 때문에 그 이상의 등급을 사용해야 콘솔에 출력됨.
					// 메세지 포맷팅 가능

		PagingVO<CheckingVO> pagingVO = new PagingVO<CheckingVO>(5,5);
		
		pagingVO.setCurrentPage(currentPage); //sp ep sr er가 결정됨
		pagingVO.setSimpleCondition(searchVO);
		
		service.retrieveFrCheckList(pagingVO);
		
		model.addAttribute("chk", pagingVO);
		
		return  "jsonView";
	}
	
	/**
	 * 점검 결과 등록
	 * @param checkingVO
	 * @return
	 */
	@PostMapping
	public String insertChecking(
			@Validated(InsertGroup.class) @ModelAttribute("checking") CheckingVO checkingVO
			, Errors errors
			) {

		boolean valid = !errors.hasErrors();
		String viewName = null;
		if(valid) {
			service.createFrCheck(checkingVO);
		}
		return "redirect:/head/frCheck";
	}
}
