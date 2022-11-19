package com.celebback.member.mypage.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.celebback.member.mypage.service.MypageService;
import com.celebback.vo.ReserveVO;

@Controller
@RequestMapping("/mypage/reserve")
public class ReserveDeleteController {
	
	@Inject
	MypageService service;
	
	@PutMapping("{resvId}")
	public String deleteReserve(
			ReserveVO resv,
			Errors errors
	) {
		String viewName = null;
		
		if(!errors.hasErrors()) {
			service.deleteReserve(resv);
			viewName = "redirect:/mypage/reserve";
		}else {
			viewName = "redirect:/mypage/reserve/{resvId}";
		}
		return viewName;
	}
}
