package com.celebback.member.mypage.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.celebback.member.mypage.service.MypageService;
import com.celebback.vo.FranVO;
import com.celebback.vo.WishVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage/wish")
public class WishRetrieveController {

	@Inject
	MypageService service;
	
	@GetMapping
	public String myWishList(
			Authentication authentication,
			Model model
	) {
		String memId = authentication.getName();
		List<WishVO> wishList = service.retrieveFranWishList(memId);
		List<FranVO> franInfo = service.retrieveFranInfo();
		model.addAttribute("wishList", wishList);
		model.addAttribute("franInfoList", franInfo);
		return "member/mypage/wishList";
	}
	
	@ResponseBody
	@PostMapping
	public void wishInsertDelete(
			@RequestBody WishVO wish,
			Authentication authentication
	) {
		log.info("**********post 넘어온 값 : {}", wish);
		
		if(authentication!=null) {
			String memId = authentication.getName();
			wish.setMemId(memId);
			if(wish.getStatus().equals("on")) {
				service.createFranWish(wish);
			}else if(wish.getStatus().equals("off")) {
				service.deleteFranWish(wish);
			}
		}
	}
}
