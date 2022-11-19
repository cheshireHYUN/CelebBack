package com.celebback.head.frPayment.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.celebback.head.frPayment.dao.FrPaymentDAO;
import com.celebback.head.frPayment.service.FrPaymentService;
import com.celebback.head.paper.service.PaperService;
import com.celebback.vo.FeePayVO;
import com.celebback.vo.FeeVO;
import com.celebback.vo.FranVO;
import com.celebback.vo.PagingVO;
import com.celebback.vo.PaperVO;
import com.celebback.vo.SimpleSearchCondition;

@Controller
@RequestMapping("/head/frPayment")
public class FrPaymentRetrieveController {
	@Inject
	FrPaymentService service;
	
	@Inject
	FrPaymentDAO frPaymentDAO;
	
	@ModelAttribute("franNameList")
	public List<Map<String, Object>> retrieveFranName(){
		return frPaymentDAO.selectFranName();
	}
	
	@GetMapping
	public String frPaymentRetrieve() {
		return "head/frPayment/frPayment";
	}
	
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

		PagingVO<FeeVO> pagingVO = new PagingVO<FeeVO>(5,3);
		
		pagingVO.setCurrentPage(currentPage); //sp ep sr er가 결정됨
		pagingVO.setSimpleCondition(searchVO);
		
		service.retrieveFrPaymentList(pagingVO);
		
		model.addAttribute("fee", pagingVO);
		
		return  "jsonView";
	}
	
	@PostMapping
	public String paperSend(
			@RequestParam(value="ownerIds",required=true) String ownerIds
			,PaperVO paperVO
			) {
		String[] searchSelectArr = ownerIds.split(",");
		paperVO.setOwnerIdList(searchSelectArr);
		service.sendPaper(paperVO);
		
		return "redirect:/head/frPayment";
	}
	
	@PostMapping(value="{franId}",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String frPaymentDetailRetrieve(
			@PathVariable("franId") String franId
			,Model model
			) {
		List<FeeVO> result = frPaymentDAO.selectDetailFaymentList(franId);
		
		model.addAttribute("detailFee", result);
		
		return "jsonView";
	}
	
	
}
