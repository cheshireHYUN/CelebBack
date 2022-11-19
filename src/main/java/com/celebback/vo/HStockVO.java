package com.celebback.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

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
@Alias("HStockVO")
@Data
public class HStockVO implements Serializable{
	
	private int rnum; // 순번
	private String buyerprodName; // 상품명
	private String buyerName; // 상품명
	private String headinRelease; // 출고가. DB에는 number지만 화면표시를 위해서 바꿈
	private String hstockQty; // 현재고(총재고)
	private String buyerprodId; // 상품id

}
