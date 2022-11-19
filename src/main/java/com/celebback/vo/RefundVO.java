package com.celebback.vo;

import lombok.Data;
/**
 * 
 * @author 황단비
 * @since 2022. 8. 30.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자            수정내용
 * --------     --------    ----------------------
 * 2022. 8. 30.       황단비      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Data
public class RefundVO {
	private String morderId;
	private String refundDate;
	private String refundState;

	private String mycpnId;
	private String payPg;
	private String payallYn; // 선결제 여부
}
