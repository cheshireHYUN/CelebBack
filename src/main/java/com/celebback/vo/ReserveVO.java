package com.celebback.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;

/**
 * @author 정아영
 * @since 2022. 8. 22.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                    수정자              수정내용
 * --------       --------    ----------------------
 * 2022. 9. 2.     정아영              reviewRemainDate 추가
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Data
public class ReserveVO {
	@NotBlank
	private String resvId;
	private String sitId;
	private String franId;
	private Integer resvPcnt;
	private String resvTime;
	private String resvDate;
	private String resvState;
	private String memId;
	private String payallYn;
	private String resvAccDate;
	
	private String franName;
	private String lguName; 
	
	private String morderId;
	private Integer payCost;
	
	private Integer morderQty;
	private String menuId;
	private String menuName;
	private Integer menuPrice;
	private String morderPrice;
	private String resvNote;
	
	private Integer subtotal;
	private Integer subtotalSum;
	
	private Integer remainDate;
	
	private String payPg;
	
	private Integer reviewRemainDate;
}
