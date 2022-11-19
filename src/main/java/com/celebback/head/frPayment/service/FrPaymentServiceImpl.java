package com.celebback.head.frPayment.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.celebback.head.frPayment.dao.FrPaymentDAO;
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

@Service
public class FrPaymentServiceImpl implements FrPaymentService{
	@Inject
	FrPaymentDAO frPaymentDAO;
	
	/**
	 * 가맹비 미납 가맹점 조회
	 */
	@Override
	public List<FeeVO> retrieveFrPaymentList(PagingVO<FeeVO> pagingVO) {
		pagingVO.setTotalRecord(frPaymentDAO.selectTotalRecord(pagingVO));
		List<FeeVO> feeList = frPaymentDAO.selectFrPaymentList(pagingVO);
		pagingVO.setDataList(feeList);
		return feeList;
	}

	/**
	 * 미납 공문 발송
	 */
	@Override
	public void sendPaper(PaperVO paperVO) {
		frPaymentDAO.sendPaper(paperVO);
	}

	/**
	 * 대시보드 출력용(서재원)
	 */
	@Override
	public List<FeeVO> retrieveFrPaymentListDashboard() {
		List<FeeVO> paymentListDashboard = frPaymentDAO.selectFrPaymentListDashboard();
		return paymentListDashboard;
	}

	@Override
	public int retrieveFrPaymentListCountDashboard() {
		int cnt = frPaymentDAO.selectFrPaymentListCountDashboard();
		return cnt;
	}

}
