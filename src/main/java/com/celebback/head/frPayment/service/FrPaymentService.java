package com.celebback.head.frPayment.service;

import java.util.List;

import com.celebback.vo.FeeVO;
import com.celebback.vo.PagingVO;
import com.celebback.vo.PaperVO;

/**
 * 
 * @author 황단비
 * @since 2022. 9. 2.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 20.        황단비             최초작성
 * 2022. 9. 2.         서재원             대시보드 출력용 메소드 추가
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

public interface FrPaymentService {

	/**
	 * 가맹비 미납 가맹점 조회
	 * @param pagingVO
	 * @return
	 */
	public List<FeeVO> retrieveFrPaymentList(PagingVO<FeeVO> pagingVO);
	
	/**
	 * 미납 공문 발송
	 * @param paperVO
	 */
	public void sendPaper(PaperVO paperVO);

	/**
	 * 대시보드 출력용 (서재원)
	 * @return
	 */
	public List<FeeVO> retrieveFrPaymentListDashboard();

	/**
	 * 대시보드 갯수 출력용 (서재원)
	 * @return
	 */
	public int retrieveFrPaymentListCountDashboard();
	
}
