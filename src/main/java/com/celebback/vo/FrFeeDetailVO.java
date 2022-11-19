package com.celebback.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

/**
 * 
 * @author 최서현
 * @since 2022. 9. 2.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 9. 2.       최서현      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Data
@Alias("FrFeeDetailVO")
public class FrFeeDetailVO {
	 
	//조건
	private String target;
	private String franId;
	private String sdate;
	private String edate;
	
	// 디테일 데이터들
	private int vSum = 0;
	private String vDate = "";
	private int vCnt = 0;
	private String vName = "";
	

}
