package com.celebback.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
/**
 * 
 * @author 황단비
 * @since 2022. 8. 10.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 10.    황단비      최초작성
 * 2022. 8. 11.    서재원      상속 테스트
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Data
@EqualsAndHashCode(of= {"ownerId"})
public class OwnerVO extends UserVO implements Serializable{
	private String ownerId;
	private String ownerName;
	private String ownerPass;
	private String ownerTel;
	private String ownerBirth;
	private String ownerPedu;
	private String ownerZip;
	private String ownerAdd1;
	private String ownerAdd2;
	private String consultSn;
	private ApplyVO apply;
	
}
