package com.celebback.member.mypage.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.celebback.member.mypage.service.MypageService;
import com.celebback.vo.MemVO2;
import com.celebback.vo.NotificationVO;

import lombok.extern.slf4j.Slf4j;

/**
 * @author 정아영
 * @since 2022. 8. 17.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                    수정자              수정내용
 * --------       --------    ----------------------
 * 2022. 8. 17.     정아영              최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Controller
@RequestMapping("/mypage")
public class MypageMainController {
	
	@Inject
	MypageService service;
	
	@GetMapping
	public String mypageMain(
			Authentication authentication,
			Model model
	) {
		String memId = authentication.getName();
		MemVO2 mem = service.retrieveMem(memId);
		log.info("**************mem : {}", mem);
		model.addAttribute("mem", mem);
		return "member/mypage/mypageMain";
	}
	
}
