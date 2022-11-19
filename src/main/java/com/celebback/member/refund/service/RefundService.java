package com.celebback.member.refund.service;

import java.io.IOException;
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
public interface RefundService {
	/**
	 * 환불
	 * @param payPg
	 */
	public void refundProcess(String payPg, String morderId);
}
