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
public class ConsultVO {
	private String consultSn;
	private String consultName;
	private String consultTel;
	private String consultDate;
	private String consultTime;
	private String consultOx;
	private String consultSf;
}
