package com.celebback.vo;

import java.io.Serializable;
import java.util.List;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.RequiredArgsConstructor;

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
 * 2022. 8. 10.    서재원                 최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

// 일반회원

@Data
@EqualsAndHashCode(of="memId")
@RequiredArgsConstructor
public class MemVO2 extends UserVO implements Serializable {
	
	@NotNull
	private String memId;
	@NotNull
	private String memPw;
	@NotNull
	private String memName;
	@NotNull
	private String memBir;
	@NotNull
	private String memTel;
	@NotNull
	private String memMail;
	private Integer memStpcnt;
	private Integer memRvcnt;
	private String memGrade;
	
	private Integer stpCpn;
	private Integer nowDate;
	
	private List<String> userRoles;

}