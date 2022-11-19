package com.celebback.member.login.dao;

import org.apache.ibatis.annotations.Mapper;

import com.celebback.vo.MemVO2;
//import com.celebback.vo.MemVO;
import com.celebback.vo.UserVO;

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
 * 2022. 8. 9.      서재원            최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface MemberDAO {
	
	/**
	 * 보류
	 * @param inputData
	 * @return
	 */
	public UserVO selectMemberForAuth(UserVO inputData);
	
	
	/**
	 * 회원 상세 조회
	 * @param memId 조회할 회원의 아이디
	 * @return 존재하지 않는 경우, null 반환
	 */
	public UserVO selectMember(String userId);

	/**
	 * 회원가입
	 * @param member
	 */
	public void insertMember(MemVO2 member);
	
	/**
	 * 회원가입시 user_role 테이블에 집어넣기
	 * @param member
	 */
	public void insertMemberUserRole(MemVO2 member);

}
