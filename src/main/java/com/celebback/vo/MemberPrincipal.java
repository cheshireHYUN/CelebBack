package com.celebback.vo;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

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
 * 2022. 8. 9.      서재원             최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

// MemberVO를 위한 Principal 객체
public class MemberPrincipal extends User{
	private UserVO realMember;

	public MemberPrincipal(UserVO realMember) {
		
		
		super(realMember.getUserId(), realMember.getUserPw(), 
					AuthorityUtils.createAuthorityList(realMember.getUserRoles().toArray(new String[realMember.getUserRoles().size()])));
		
		this.realMember = realMember;
	}
	
	public UserVO getRealMember() {
		return realMember;
	}
}
