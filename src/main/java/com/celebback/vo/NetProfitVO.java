package com.celebback.vo;

import lombok.Data;

/**
 * 
 * @author 서재원
 * @since 2022. 8. 26.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 26.         서재원             최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Data
public class NetProfitVO {
	
	// 월
	private String month; 
	
	// 1. 매출액
	private Integer salesRevenue;
	private Integer frorderPrice; // 1-1. 제품판매액
	private Integer feeFruse; // 1-2. 가맹비
	private Integer feeRoyal; // 1-3. 수익쉐어비
	private Integer feeOverdue; // 1-4. 연체이자
	
	// 2. 매출원가
	private Integer buyerprodPrice;
	
	private Integer multiply; // 곱. 이거 추가 안하니까 곱해진 값이 보이지 않았다...
	
	// 3. 판매비와관리비
	private Integer sna;
	private Integer headempSalary; // 3-1. 인건비
	private Integer feeCpn; // 3-2. 판매부대비용(쿠폰지원금)
	
	// 4. 영업외비용 (기부금)
	private Integer donatePrice;
	
	// 5. 영업이익
	private Integer operatingProfit;
	
	// 6. 당기순이익
	private Integer netProfit;
	
	// 7. 영업이익률
	private String opm;
	
}
