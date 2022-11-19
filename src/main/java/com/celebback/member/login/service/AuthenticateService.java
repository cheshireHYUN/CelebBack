package com.celebback.member.login.service;

import com.celebback.enumpkg.ServiceResult;
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
 * 2022. 8. 9.    서재원                최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
public interface AuthenticateService {
	/**
	 * id와 password 기반의 인증 로직
	 * @param inputData id와 password를 가진 VO
	 * @return 존재하지 않을때(NOTEXIST), 비번오류(INVALIDPASSWORD), 성공(OK)
	 */
	public ServiceResult authenticate(UserVO inputData);
}
