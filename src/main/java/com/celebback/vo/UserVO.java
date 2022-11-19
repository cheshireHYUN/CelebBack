package com.celebback.vo;

import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

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
 * 2022. 8. 8.    서재원                 최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

// USER

@Data
@EqualsAndHashCode(of="userId")
public class UserVO implements Serializable {
	
	private String userId;
	private String userPw;
	
	private List<String> userRoles;

}
