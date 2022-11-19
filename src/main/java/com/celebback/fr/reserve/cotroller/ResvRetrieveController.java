package com.celebback.fr.reserve.cotroller;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.celebback.fr.frOrder.service.FrOrderService;
import com.celebback.fr.reserve.service.ResvService;
import com.celebback.vo.FrOrderVO;
import com.celebback.vo.PagingVO;
import com.celebback.vo.ReserveVO;
import com.celebback.vo.SimpleSearchCondition;

/**
 * 
 * @author 이혜원
 * @since 2022. 8. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 5.       이혜원      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Controller
@RequestMapping("/fr/reserve/resvList")
public class ResvRetrieveController {
	
	@Inject
	ResvService resvService;
	
	@Inject
	FrOrderService frOrderService;
	
//	@GetMapping
//	public String resvList() {
//		return "fr/reserve/resvList";
//	}
	
	@GetMapping()
	public String todayResvList(
			Principal principal
			,Model model
	) {
		// franId 구하기
		String authName = principal.getName();
		String franId = frOrderService.retrieveFranId(authName);
		
		// 조회내역 구하기
		List<ReserveVO> todayList = resvService.retrieveTodayResvList(franId);
		model.addAttribute("todayList", todayList);
		return "fr/reserve/resvList";
	}
	
	/**
	 * 예약내역 조회
	 * @param principal
	 * @param model
	 * @param searchType
	 * @param searchWord
	 * @param currentPage
	 * @param searchStartDate
	 * @param searchEndDate
	 * @return
	 */
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String proccessJsonData(
			Principal principal
			,Model model
			,@RequestParam(value="searchType",required=false) String searchType
			,@RequestParam(value="searchWord",required=false) String searchWord
			,@RequestParam(value="page",required=false, defaultValue="1") int currentPage
			,@RequestParam(value="searchStartDate",required=false) String searchStartDate
			,@RequestParam(value="searchEndDate",required=false) String searchEndDate
	) {
		
		String authName = principal.getName();
		String franId = frOrderService.retrieveFranId(authName);
		SimpleSearchCondition searchVO = new SimpleSearchCondition(searchStartDate, searchEndDate, searchType, searchWord);
		
		PagingVO<ReserveVO> pagingVO = new PagingVO<ReserveVO>(7,5);
		
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(searchVO);
		pagingVO.setFranId(franId);
		
		resvService.retrieveResvList(pagingVO);
		
		model.addAttribute("frResv", pagingVO);
		
		return "jsonView";
		
	}
	
	@PostMapping(value="/{resvId}", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String resvDetail(
			@PathVariable String resvId
	) {
		System.out.println(resvId);
		return "";
	}
	

}
