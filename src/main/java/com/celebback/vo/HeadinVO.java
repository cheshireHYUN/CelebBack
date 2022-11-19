package com.celebback.vo;

import java.io.Serializable;

import lombok.Data;

/**
 * 
 * @author 서재원
 * @since 2022. 8. 17.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 17.         서재원             최초작성, 거래처매입내역 뿌리기용 VO
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Data
public class HeadinVO implements Serializable{
	
	// 필요한 레코드 : 거래처명, 제품명, 입고수량, 입고날짜, 총재고수량
	
	private String buyerprodId; // 제품ID 
	// 기본키는 제품 ID와 입고 날짜를 섞은 복합키.

	private String rnum; // 일련번호
	private String buyerName; // 거래처명
	private String buyerprodName; // 제품명
	private String buyerprodPrice; // 입고가격
	private Integer headinQty; // 입고수량
	private String totalPrice; // 총입고가격
	private String headinDate; // 입고 날짜
	
	// 당장은 필요 없으므로 간격을 띄워둠
	private Integer headinRelease; // 출고가(판매가)

	private String buyerId;
	
	// 날짜 검색용도
	private String searchStartDate;
	private String searchEndDate;
}
