package com.celebback.vo;

import lombok.Data;
/**
 * 
 * @author 황단비
 * @since 2022. 8. 19.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자            수정내용
 * --------     --------    ----------------------
 * 2022. 8. 19.       황단비      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Data
public class TradeVO {
	private String tradeNo;
	private String buyerprodId;
	private String reqFran;
	private Integer reqQty;
	private String reqDate;
	private String respFran;
	private Integer respQty;
	private String tradeNote;
	private String tradeState;
	private String ownerId;
	
	/**
	 * 편의
	 */
	public String franId         ;
	public String franName       ;
	public String ownerName      ;
	public String franAdd1       ;
	public String buyerprodName  ; // 재료명
	public String frstockQty     ;
	public String franTel        ;
	public String reqTime;
	public String state; // 수신,발신
	public int rnum;
	
	private String authName;
}
