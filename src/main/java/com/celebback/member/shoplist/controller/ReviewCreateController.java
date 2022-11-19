package com.celebback.member.shoplist.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.celebback.member.shoplist.service.ShopService;
import com.celebback.validate.InsertGroup;
import com.celebback.vo.ReserveVO;
import com.celebback.vo.ReviewVO;

import lombok.extern.slf4j.Slf4j;

/**
 * @author 정아영
 * @since 2022. 8. 31.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                    수정자              수정내용
 * --------       --------    ----------------------
 * 2022. 8. 31.     정아영              최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Controller
@RequestMapping("/review/{franId}")
public class ReviewCreateController {
	
	@Inject
	ShopService service;
	
	@GetMapping
	public String reviewList(
			Model model,
			@ModelAttribute("franId") String franId
	) {
		List<ReviewVO> reviewList = service.retrieveReviewList(franId);
		
		model.addAttribute("reviewList", reviewList);
		
		return "member/shop/reviewForm";
	}
	
	@ModelAttribute("review")
	public ReviewVO review() {
		return new ReviewVO();
	}
	
	@ModelAttribute("reviewDateList")
	public List<ReserveVO> possible(
			Authentication authentication,
			@ModelAttribute("review") ReviewVO review
	){
		
		List<ReserveVO> possibleList = null;
		ReviewVO reviewVO = new ReviewVO();
		if(authentication!=null) {
			String memId = authentication.getName();
			String franId = review.getFranId();
			reviewVO.setMemId(memId);
			reviewVO.setFranId(franId);
			possibleList = service.retrieveReviewPossibleList(reviewVO);
		}
		log.info("*************review {}", review);
		log.info("*************reviewVO {}", reviewVO);
		log.info("*************possibleList {}", possibleList);
		return possibleList;
	}
	
	@PostMapping
	public String reviewInsert(
			@Validated(InsertGroup.class) @ModelAttribute("review") ReviewVO review
			, Errors errors
	) {
		String viewName = null;
		
		if(!errors.hasErrors()) {
			service.createReview(review);
			String franId = review.getFranId();
			viewName = "redirect:/review/"+franId;
		}else {
			viewName = "member/shop/reviewForm";
		}
		
		return viewName;
	}
}
