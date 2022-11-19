package com.celebback.member.shoplist.controller;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.celebback.member.mypage.service.MypageService;
import com.celebback.member.shoplist.service.ShopService;
import com.celebback.vo.ReviewVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/review/{franId}")
public class ReviewDeleteController {

	@Inject
	ShopService service;
	
	@Inject
	MypageService mypageService;
	
	@DeleteMapping
	public String deleteReview(
			Authentication authentication,
			ReviewVO review,
			Errors errors
	) {
		
		String viewName = null;
		
		log.info("*********review********** {}", review);
		log.info("*********reviewSn********** {}", review.getReviewSn());
		log.info("*********franId********** {}", review.getFranId());

		if(!errors.hasErrors()) {
			Integer reviewSn = review.getReviewSn();
			service.deleteReview(reviewSn);
			String memId = authentication.getName();
			mypageService.updateReviewCountMinusToMem(memId);
			String franId = review.getFranId();
			viewName = "redirect:/review/"+franId;
		}else {
			String franId = review.getFranId();
			viewName = "redirect:/review/"+franId;
		}
		
		return viewName;
	}
}
