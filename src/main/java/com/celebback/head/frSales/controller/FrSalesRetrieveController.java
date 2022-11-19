package com.celebback.head.frSales.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.celebback.head.fr.dao.FrDAO;
import com.celebback.head.frPayment.dao.FrPaymentDAO;
import com.celebback.vo.FranVO;
import com.celebback.vo.PagingVO;
import com.celebback.vo.ProfitVO;
import com.celebback.vo.SimpleSearchCondition;

@Controller
@RequestMapping("/head/frSales")
public class FrSalesRetrieveController {
	
	@Inject
	FrPaymentDAO frPaymentDAO;
	
	@ModelAttribute("franNameList")
	public List<Map<String, Object>> retrieveFranName(){
		return frPaymentDAO.selectFranName();
	}
	@ModelAttribute("chart2")
	public List<Map<String, Object>> selectWholeFLank(){
		return frPaymentDAO.selectWholeFLank();
	}
	@ModelAttribute("chart3")
	public List<Map<String, Object>> selectLocaFLank(){
		return frPaymentDAO.selectLocaFLank();
	}
	@ModelAttribute("chart5")
	public List<Map<String, Object>> selectMonthFLank(){
		return frPaymentDAO.selectMonthFLank();
	}
	@ModelAttribute("fLank1")
	public List<Map<String, Object>> selectSeasonFLank1(){
		return frPaymentDAO.selectSeasonFLank1();
	}
	@ModelAttribute("fLank2")
	public List<Map<String, Object>> selectSeasonFLank2(){
		return frPaymentDAO.selectSeasonFLank2();
	}
	@ModelAttribute("fLank3")
	public List<Map<String, Object>> selectSeasonFLank3(){
		return frPaymentDAO.selectSeasonFLank3();
	}
	@ModelAttribute("fLank4")
	public List<Map<String, Object>> selectSeasonFLank4(){
		return frPaymentDAO.selectSeasonFLank4();
	}
	
	@GetMapping
	public String frSalesretrieve() {
		
		return "head/frSales/frSales";
	}
	
	@PostMapping(value="search" ,produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String proccessJsonData(
			Model model
			,@RequestParam(value="searchType",required=false) String searchType // searchType파라미터가 필요한데 꼭 필요한건 아니야
			,@RequestParam(value="searchWord",required=false)String searchWord
			,@RequestParam(value="searchStartDate",required=false)String searchStartDate // 년도
			,@RequestParam(value="searchEndDate",required=false)String searchEndDate // 월
			,ProfitVO prof
			) {
		SimpleSearchCondition searchVO = new SimpleSearchCondition(searchStartDate,searchEndDate,searchType, searchWord);
		prof.setSimpleCondition(searchVO);
		
		if(searchVO.getSearchWord()!="") {
			Map<String, Object> chart=frPaymentDAO.selectChart(prof);
			
			prof = frPaymentDAO.selectFrSales(prof);
			model.addAttribute("prof",prof);
			model.addAttribute("chart",chart);
		}
		
		return  "jsonView";
	}
}
