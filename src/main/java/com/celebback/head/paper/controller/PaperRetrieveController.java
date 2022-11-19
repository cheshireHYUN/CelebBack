package com.celebback.head.paper.controller;

import java.io.IOException;
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.annotation.MultipartConfig;
import javax.validation.constraints.NotNull;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.celebback.head.frPayment.dao.FrPaymentDAO;
import com.celebback.head.paper.dao.PaperDAO;
import com.celebback.head.paper.service.PaperService;
import com.celebback.validate.DeleteGroup;
import com.celebback.validate.InsertGroup;
import com.celebback.validate.UpdateGroup;
import com.celebback.vo.CheckingVO;
import com.celebback.vo.PagingVO;
import com.celebback.vo.PaperVO;
import com.celebback.vo.SimpleSearchCondition;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 황단비
 * @since 2022. 8. 16.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자            수정내용
 * --------     --------    ----------------------
 * 2022. 8. 16.       황단비      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Controller
@RequestMapping("/head/paper")
@MultipartConfig
public class PaperRetrieveController {
	@Inject
	PaperService service;
	
	@Inject
	PaperDAO paperDAO;
	
	@ModelAttribute("ownerIdList")
	public List<Map<String, Object>> retrieveFranName(){
		return paperDAO.selectOwnerId();
	}
	
	@ModelAttribute("paper")
	public PaperVO makeChecking(){
		return new PaperVO();
	}
	
	/**
	 * 공문 페이지 틀
	 * @return
	 */
	@GetMapping
	public String paperListRetrieve() {
		return "head/paper/paperList";
	}
	
	/**
	 * 공문 전체조회 json
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
			) {

		SimpleSearchCondition searchVO = new SimpleSearchCondition(searchType, searchWord);
		
//		log.info("searchType : {}, searchWord : {}",searchType,searchWord); // info로 설정했기 때문에 그 이상의 등급을 사용해야 콘솔에 출력됨.
					// 메세지 포맷팅 가능

		PagingVO<PaperVO> pagingVO = new PagingVO<PaperVO>(5,3);
		
		pagingVO.setCurrentPage(currentPage); //sp ep sr er가 결정됨
		pagingVO.setSimpleCondition(searchVO);
		
		service.retrievePaper(pagingVO);
		
		model.addAttribute("paper", pagingVO);
		
		return  "jsonView";
	}
	
//	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
//	public String paperDataTable(Model model) {
//		List<PaperVO> data = service.retrievePaper();
//		model.addAttribute("data",data);
//		return "jsonView";
//	}

	/**
	 * 공문 상세조회 json
	 * @param paperId
	 * @param model
	 * @return
	 */
	@PostMapping(value="/{paperId}",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String paperDetailRetrieve(
			@PathVariable String paperId
			,Model model
			) {
		PaperVO detail = service.retrievePaper(paperId);
		model.addAttribute("paper",detail);
		
		
		return "jsonView";
//		return "head/paper/paperDetail"; jsp 지우기
	}

	/**
	 * 공문 등록
	 * @param paper
	 * @param errors
	 * @return
	 * @throws IOException 
	 */
	@PostMapping
	public String paperCreate(
			@Validated(InsertGroup.class) @ModelAttribute("paper") PaperVO paper
			, Errors errors
			,MultipartHttpServletRequest request
			) throws IOException {
		String viewName = null;
		if(!errors.hasErrors()) {
			service.insertPaper(paper,request);
			viewName="redirect:/head/paper";
		}
//		return "success";
		return viewName;
	}
	
	/**
	 * 공문 수정
	 * @param paper
	 * @param errors
	 * @param model
	 * @return
	 */
	@PutMapping("/{paperId}")
	public String paperUpdate(
			@Validated(UpdateGroup.class) @ModelAttribute("paper") PaperVO paper
			,Errors errors
			,Model model
			) {
		String viewName = null;
		if(!errors.hasErrors()) {
			service.modifyPaper(paper);
			viewName="redirect:/head/paper";
		}
		return viewName;
	}
	
	/**
	 * 공문 삭제
	 * @param paper
	 * @param errors
	 * @return
	 */
	@DeleteMapping("/{paperId}")
	public String paperDelete(
			@Validated(DeleteGroup.class) @ModelAttribute("paper") PaperVO paper
			,Errors errors
			) {
		String viewName = null;
		String paperId = paper.getPaperId();
		if(!errors.hasErrors()) {
			service.deletePaper(paperId);
			viewName="redirect:/head/paper";
		}
		return viewName;
	}
	
	/**
	 * 공문 발송
	 * @param paperVO
	 * @param request
	 * @return
	 * @throws IOException 
	 */
	@PostMapping("/send")
	@ResponseBody
	public String sendPaper(
			@ModelAttribute("paper") PaperVO paperVO
			) throws IOException {
		String viewName = null;
		service.sendPaper(paperVO);
		
		return "success";
	}
}
