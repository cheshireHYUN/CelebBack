package com.celebback.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 *  
 * @author 서재원
 * @since 2022. 8. 10.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 10.    서재원             최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */


@Data
@EqualsAndHashCode(of= {"adminId"})
public class AdminVO extends UserVO implements Serializable{

	private String adminId;
	private String adminPw;
	private String authCode;
	
}
