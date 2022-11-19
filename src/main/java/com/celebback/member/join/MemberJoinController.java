package com.celebback.member.join;

import javax.inject.Inject;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.celebback.member.login.service.MemberServiceImpl;
import com.celebback.vo.MemVO2;

/**
 * 
 * @author 서재원
 * @since 2022. 8. 8.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 8.      306-11      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Controller
@RequestMapping("/join")
public class MemberJoinController {
	
	@Inject
	MemberServiceImpl service;
	
	@Inject
	PasswordEncoder passEncoder;
	
	@ModelAttribute("member") // 이 메소드 없으면 500 오류남.. 왜지?
	public MemVO2 member() {
		return new MemVO2();
	}
	
	// 회원가입폼
	@GetMapping
	public String memberJoinForm() {
		return "member/join/joinForm";
	}
	
	@PostMapping
	public String memberJoin(@ModelAttribute("member") MemVO2 member) {
		member.setMemPw(passEncoder.encode(member.getMemPw())); // 암호화
		service.insertMember(member);
		return "member/login/loginForm"; //가입이 완료되면 로그인폼으로 이동
	}

}
