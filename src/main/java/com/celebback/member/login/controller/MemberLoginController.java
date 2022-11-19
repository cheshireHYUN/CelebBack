package com.celebback.member.login.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.celebback.enumpkg.ServiceResult;
import com.celebback.member.login.service.AuthenticateService;


/**
 * 
 * @author 서재원
 * @since 2022. 8. 9.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 9.    서재원            최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Controller
@RequestMapping("/login")
public class MemberLoginController {
	
	@Inject
	AuthenticateService service;
	
/*	private boolean validate(MemVO mem) {
		return StringUtils.isNotBlank(mem.getMemId()) 
				&& 
			   StringUtils.isNotBlank(mem.getMemPw());
	}*/
	
	@GetMapping
	public String memberLogin() {
		return "member/login/loginForm";
	}
	
/*	@PostMapping
	public String memberLoginProcess(MemVO inputData, HttpSession session) {
		// 1. 검증
		boolean valid = validate(inputData);
		String view = null;
		if(valid) {
//			   - 통과
//			   	 2. 처리(로그인 여부 판단)
				ServiceResult result = service.authenticate(inputData);
				if(ServiceResult.OK.equals(result)) {
//					Post-Redirect-Get 패턴
//			   	 	- 로그인 성공 : welcome 페이지로 이동 (redirect)
					MemVO authMember = inputData;
					session.setAttribute("message", "로그인 성공");
					session.setAttribute("authMember", authMember);
					view = "redirect:/";
				}else {
//			   	 	- 실패 : loginForm 으로 이동(forward)
					String message = null;
					if(ServiceResult.NOTEXIST.equals(result)) {
						message = "회원 가입이 필요함.";
					}else {
						message = "비밀번호 오류.";
					}
					session.setAttribute("message", message);
					view = "redirect:/member/login/loginForm.jsp";
				}
			}else {
//			   - 불통 : loginForm 으로 이동(forward)
				session.setAttribute("message", "검증 실패");
				view = "redirect:/member/login/loginForm.jsp";
			}
			
			return view;
		}*/
	
}
