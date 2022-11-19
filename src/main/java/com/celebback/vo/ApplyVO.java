package com.celebback.vo;
/**
 * 
 * @author 황단비
 * @since 2022. 8. 10.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자            수정내용
 * --------     --------    ----------------------
 * 2022. 8. 10.       황단비      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

import lombok.Data;

@Data
public class ApplyVO {
	private String consultSn;
	private String applyZip;
	private String applyAdd1;
	private String applyAdd2;
	private Integer applyMoney;
	private ConsultVO consult;
}
