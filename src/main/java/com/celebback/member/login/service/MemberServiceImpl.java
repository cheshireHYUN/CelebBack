package com.celebback.member.login.service;

import javax.annotation.Resource;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.security.web.authentication.preauth.PreAuthenticatedCredentialsNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.celebback.member.login.dao.MemberDAO;
import com.celebback.vo.MemVO2;
//import com.celebback.vo.MemVO;
import com.celebback.vo.MemberPrincipal;
import com.celebback.vo.UserVO;

import lombok.RequiredArgsConstructor;

@Service("memberServiceImpl")
@RequiredArgsConstructor
public class MemberServiceImpl implements UserDetailsManager {
	
	private final MemberDAO dao;
	
	@Resource(name="authenticationManager")
	private AuthenticationManager authenticationManager;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserVO realMember = dao.selectMember(username); // 사용자 정보 가져옴. 매니저면. 매니저정보가지고있는 테이블 조회해서 구체적 정보를 가져온다. 
		
		if(realMember==null)
			throw new UsernameNotFoundException(username+" 사용자 없음.");
		return new MemberPrincipal(realMember);
	}

	private UserVO getRealMember(UserDetails userDetail) {
		return ((MemberPrincipal) userDetail).getRealMember();
	}
	
	@Override
	public void createUser(UserDetails user) {
//		dao.insertMember(getRealMember(user));
	}
	
	/**
	 * 회원가입
	 * @param member
	 */
	public void insertMember(MemVO2 member) {
		
		if(dao.selectMember(member.getMemId())==null) { // 이미 있는 회원이 아니라면
			dao.insertMember(member);
			dao.insertMemberUserRole(member);			
		}
		
	}
	

	@Override
	public void updateUser(UserDetails user) {
/*		Authentication authToken = new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword());
		authenticationManager.authenticate(authToken);
		dao.updateMember(getRealMember(user));
		createNewAndChangeAuthentication(authToken);*/
	}

	@Override
	public void deleteUser(String username) {
/*		dao.deleteMember(username);*/
	}

	@Override
	public void changePassword(String oldPassword, String newPassword) {
/*		String memId = getCurrentAuthentication().getName();
		authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(memId, oldPassword));
		MemberVO input = new MemberVO();
		input.setMemId(memId);
		input.setMemPass(newPassword);
		dao.updatePassword(input);
		createNewAndChangeAuthentication(new UsernamePasswordAuthenticationToken(memId, newPassword));*/
	}

	@Override
	public boolean userExists(String username) {
		return dao.selectMember(username)!=null;
	}

	private Authentication getCurrentAuthentication() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if(authentication==null)
			throw new PreAuthenticatedCredentialsNotFoundException("아직 로그인 하기 전.");
		return authentication;
	}
	
	private void createNewAndChangeAuthentication(Authentication authenticationToken) {
		Authentication newAuthentication = authenticationManager.authenticate(authenticationToken);
		SecurityContextHolder.getContext().setAuthentication(newAuthentication);
	}
}
