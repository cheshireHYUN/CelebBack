package com.celebback.member.mypage.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.celebback.member.shoplist.service.ShopService;
import com.celebback.vo.ReviewVO;

@Controller
@RequestMapping("/mypage/review")
public class MyReviewDeleteController {

	@Inject
	ShopService service;
	
	@DeleteMapping
	public String deleteReview(
			ReviewVO review,
			Errors errors
	) {
		
		String viewName = null;

		if(!errors.hasErrors()) {
			Integer reviewSn = review.getReviewSn();
			service.deleteReview(reviewSn);
			viewName = "redirect:/mypage/review";
		}else {
			viewName = "redirect:/mypage/review";
		}
		
		return viewName;
	}
}
