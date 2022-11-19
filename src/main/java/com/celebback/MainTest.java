package com.celebback;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class MainTest {
	
	@GetMapping
	public String prodInfoList() { // 전체조회
		return "home";
	}
	
//	@GetMapping("{prodNo}")
//	public String prodInfoDetail() { // 상세조회. 나중에 수정
//		return "/head/prodInfo/prodInfoDetail";
//	}

}