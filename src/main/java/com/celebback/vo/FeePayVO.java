package com.celebback.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
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
 * 2022. 9. 02.    최서현            사용
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */ 
@Data 
@Alias("FeePayVO")
public class FeePayVO {
	private String feeId;
	private Integer feeCost;
	private int rnum;
	
	// 납부날짜
	private String feepayDate;

	
	private String franId;
	// 납부할 내역이 생긴 날짜 (즉, 9/1은 8월분임)
	private String feeSdate;

}
