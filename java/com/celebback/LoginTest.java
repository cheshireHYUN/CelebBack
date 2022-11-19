package com.celebback;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login/loginForm.do")
public class LoginTest {
	
	@GetMapping
	public String prodInfoList() { // 전체조회
		return "loginForm";
	}
	
//	@GetMapping("{prodNo}")
//	public String prodInfoDetail() { // 상세조회. 나중에 수정
//		return "/head/prodInfo/prodInfoDetail";
//	}

}