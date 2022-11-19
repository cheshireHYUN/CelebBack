package com.celebback.head.netprofit.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.celebback.head.netprofit.service.NetProfitService;
import com.celebback.vo.NetProfitVO;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 서재원
 * @since 2022. 8. 26.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 26.         서재원             최초작성
 * 2022. 8. 30.         서재원             비동기 방식으로 수정
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Controller
@RequestMapping("/head/netProfit")
@Slf4j
public class NetProfitRetrieveController {
	
	@Inject
	NetProfitService service;
	
	@GetMapping
	public String netProfitList(
			) {
		return "head/netProfit/netProfitList";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String netProfitList(
			@RequestParam(name="month", required=false) String month,
			@RequestParam(name="chartYear", required=false) String chartYear,
			@RequestParam(name="firstMonth", required=false) String firstMonth,
			@RequestParam(name="secondMonth", required=false) String secondMonth,
			@RequestParam(name="thirdMonth", required=false) String thirdMonth,
			@RequestParam(name="fourthMonth", required=false) String fourthMonth,
			@RequestParam(name="fifthMonth", required=false) String fifthMonth,
			@RequestParam(name="sixthMonth", required=false) String sixthMonth,
			Model model
			) {
		if(month!=null) {
			NetProfitVO netProfit = service.retrieveNetProfit(month);
			model.addAttribute("netProfit", netProfit);
		} else {
			Map<String, String> map = new HashMap<>();
			map.put("chartYear", chartYear);
			map.put("firstMonth", firstMonth);
			map.put("secondMonth", secondMonth);
			map.put("thirdMonth", thirdMonth);
			map.put("fourthMonth", fourthMonth);
			map.put("fifthMonth", fifthMonth);
			map.put("sixthMonth", sixthMonth);
			
			List<NetProfitVO> netProfitChart = service.retrieveNetProfitChart(map);
			model.addAttribute("netProfitChart", netProfitChart);
		}
		return "jsonView";
	}

}