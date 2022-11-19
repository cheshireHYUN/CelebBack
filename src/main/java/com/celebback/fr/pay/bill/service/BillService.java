package com.celebback.fr.pay.bill.service;

import java.util.List;

import org.springframework.security.core.Authentication;

import com.celebback.vo.BillVO;

/**
 * 
 * @author 최서현
 * @since 2022. 8. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 5.       최서현      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
public interface BillService {
	
	public BillVO billList (BillVO vo,  Authentication authentication);
	
	public void billCreate (BillVO vo, Authentication authentication);
	
	public void billUpdate (BillVO vo);
	
	// 차트 조회
	public List<BillVO> retrieveBillList(BillVO vo);
	
	
}
