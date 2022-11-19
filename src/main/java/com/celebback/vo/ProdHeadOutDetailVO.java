package com.celebback.vo;

import java.io.Serializable;

import lombok.Data;

/**
 * 
 * @author 서재원
 * @since 2022. 8. 24.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 24.         서재원             최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

// 따로 이러한 테이블이 있는 것은 아니고, 종합적인 데이터를 조회하기 위해 따로 만든 VO임

@Data
public class ProdHeadOutDetailVO implements Serializable{

	
	private int rnum;
	
	// 조회시 필요한 컬럼
	
	private String franId;
	private String buyerprodId;
	private String frorderNo;
	
	// 실 조회 데이터
	private String franName;
	private int headoutQty;
	private String headoutDate;
	
}
