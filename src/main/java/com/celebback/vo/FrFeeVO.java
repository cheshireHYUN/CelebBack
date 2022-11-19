package com.celebback.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

/**
 * 
 * @author 최서현
 * @since 2022. 9. 1.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 9. 1.       최서현      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Data
@Alias("FrFeeVO")
public class FrFeeVO {
	
	// 조건

	private String franId;
	private String feeSdate;
	
	// 결과
	private String feeId;
	private String feeFruse;
	private String feeRoyal;
	private String feeCost;
	private String feeTplus;
	private String feeTminus;
	private String feeOverdue;
	private String feeCpn;
	private String feepayDate;
	

}
