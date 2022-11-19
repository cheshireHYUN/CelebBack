package com.celebback.member.mypage.controller;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.celebback.member.mypage.service.MypageService;
import com.celebback.vo.MemVO2;

@Controller
@RequestMapping("/mypage/account")
public class AccountUpdateController {
	
	@Inject
	MypageService service;
	
	@GetMapping
	public String memberEdit(
			Authentication authentication,
			Model model
	) {
		String memId = authentication.getName();
		if(!model.containsAttribute("member")) {
			MemVO2 account = service.retrieveMyAccount(memId);
			model.addAttribute("member", account);
		}
		return "member/mypage/accountEdit";
	}
	
	@PutMapping
	public String memberUpdate(
	) {
		String viewName = null;
		
		return viewName;
	}
}
