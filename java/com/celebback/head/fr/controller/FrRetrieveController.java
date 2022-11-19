package com.celebback.head.fr.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.celebback.head.fr.dao.FrDAO;
import com.celebback.head.fr.service.FrService;
import com.celebback.vo.FranVO;
import com.celebback.vo.PagingVO;
import com.celebback.vo.SimpleSearchCondition;

/**
 * 
 * @author 황단비
 * @since 2022. 8. 4.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자            수정내용
 * --------     --------    ----------------------
 * 2022. 8. 4.       황단비      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/head/fr")
@MultipartConfig
public class FrRetrieveController {
	@Inject
	FrService service;
	
	@Inject
	FrDAO frDAO; // 단순 데이터 조회용(체크박스, 지도 좌표)
	
	@ModelAttribute("stateList")
	public List<Map<String, Object>> stateList(){
		return frDAO.selectFranState();
	}
	
	@GetMapping
	public String frListRetrieve() {
		return "head/fr/frList";
	}
	
	@PostMapping
	public String retrieveBoardExcelUp(
			@RequestParam(value="excelUp",required=false) MultipartFile file
			,MultipartHttpServletRequest request
			) throws IOException {
		service.excelUpload(request);
		return "head/fr/frList";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String proccessJsonData(
			Model model
			,@RequestParam(value="searchType",required=false) String searchType // searchType파라미터가 필요한데 꼭 필요한건 아니야
			,@RequestParam(value="searchWord",required=false)String searchWord
			,@RequestParam(value="searchSelect",required=false)String searchSelect
			,@RequestParam(value="page",required=false, defaultValue="1") int currentPage
			) {

		String[] searchSelectArr = searchSelect.split(",");
		SimpleSearchCondition searchVO = new SimpleSearchCondition(searchType, searchWord,searchSelect,searchSelectArr);
		
//		log.info("searchType : {}, searchWord : {}",searchType,searchWord); // info로 설정했기 때문에 그 이상의 등급을 사용해야 콘솔에 출력됨.
					// 메세지 포맷팅 가능

		PagingVO<FranVO> pagingVO = new PagingVO<FranVO>(5,3);
		
		pagingVO.setCurrentPage(currentPage); //sp ep sr er가 결정됨
		pagingVO.setSimpleCondition(searchVO);
		
		service.retrieveFranList(pagingVO);
		
		List<FranVO> map = frDAO.selectMap(pagingVO);
		model.addAttribute(map);
		
		model.addAttribute("fran", pagingVO);
		
		return  "jsonView";
	}
	
	
	@GetMapping("/{franId}")
	public String frDatailRetrieve(
			Model model
			,@PathVariable("franId") String franId
			) {
		FranVO fran = service.retrieveFran(franId);
		model.addAttribute("fran",fran);
		return "head/fr/frDetail";
	}
	
	@GetMapping("/excelDown")
	public String excelDown(HttpServletResponse res ) {
		service.excelDownload(res);
		return "head/fr/frList";
	}
	@GetMapping(value="/dataTable",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String dataTable(Model model) {
		List<FranVO> data = frDAO.selectFranDataTable();
		model.addAttribute("data",data);
		
		return "jsonView";
	}
	
//	@GetMapping(value="/map",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
//	public String mapLoading(Model model) {
//		List<FranVO> map = frDAO.selectMap();
//		model.addAttribute(map);
//		return "head/fr/frList";
//	}
	
	
}