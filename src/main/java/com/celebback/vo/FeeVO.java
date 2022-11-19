package com.celebback.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 
 * @author 황단비
 * @since 2022. 8. 20.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자            수정내용
 * --------     --------    ----------------------
 * 2022. 8. 20.       황단비      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Data
@EqualsAndHashCode(of={"feeId"})
public class FeeVO {
	private String feeId;
	private String franId;
	private String feeSdate;
	private Integer feeFruse;
	private Integer feeRoyal;
	private Integer feeCost;
	private Integer feeTplus;
	private Integer feeTminus;
	private Integer feeOverdue;
	private FeePayVO feePay;
	
	private int rnum;
	
	/**
	 * 편의를 위해...
	 */
	private String franName;
	private String ownerName;
	private String ownerId;
	private String feeDate;
	
	
}
