package com.celebback.vo;

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
 * 2022. 8. 10.       이혜원      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Data
public class FrStockVO {
	private String buyerProdId;
	private String buyerProdName;
	private String buyerProdPrice;
	private int franInQty;
	private int franOutQty;
	private int frStockQty;
	private int atOrderQty;
	private String franId;
	private String ownerId;
	private String lguName;
	private int allFranInQty;
	private int monFranInQty;
	private int allFranOutQty;
	private int monFranOutQty;

}
