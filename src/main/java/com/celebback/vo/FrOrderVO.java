package com.celebback.vo;

import java.util.List;
import java.util.Map;

import lombok.Data;

/**
 * 
 * @author 이혜원
 * @since 2022. 8. 10.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 10.    이혜원              최초작성
 * 2022. 8. 20.    서재원		   전체조회시 필요한 필드 추가
 * 2022. 9. 06.    서재원		   상세조회시 필요한 필드 추가 (주문액)
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Data
public class FrOrderVO {
	private String frOrderNo;
	private String frOrderDate;
	private String frOrderPrice;
	private String frOrderState;
	private String buyerProdId;
	private String buyerProdName;
	private String buyerProdPrice;
	private int hstockQty;
	private int frStockQty;
	private int atOrderQty;
	
	// 상세
	private String dtOrderName;
	private int dtOrderQty;
	private String dtOrderPrice;
	
	private int bestQty;
	private int franInQty;
	private String franInDate;
	private String franId;
	private String authName;
	private String lguName;
	private int rnum;
	private String allQty;
	private List<Map<String, Object>> dtList;
	
	// 추가
	private String franName;
	private String franAdd1;
	private String franAdd2;
	private String franAdd;
	
	// 상세조회 각 주문액
	private String qtyPrice;
	
	// 출고가(가맹점매입가)
	private String headinRelease;
	
	// 날짜 검색용도
	private String searchStartDate;
	private String searchEndDate;
	
}
