package com.celebback.vo;

import java.io.Serializable;

import lombok.Data;

/**
 * 
 * @author 이혜원
 * @since 2022. 8. 9.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 9.       이혜원      최초작성
 * 2022. 8. 12.      서재원      직렬화 implements
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Data
public class BuyerVO implements Serializable{
	
	private int rnum;
	private String buyerId;
	private String buyerName;
	private String buyerTel;
	private String buyerAdd;
	private String buyerCharger;
	private String buyerMail;

}
