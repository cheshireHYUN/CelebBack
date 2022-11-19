package com.celebback.head.frorder.service;

import java.util.List;

import com.celebback.vo.FrOrderVO;
import com.celebback.vo.PagingVO;

/**
 * 
 * @author 서재원
 * @since 2022. 8. 20.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 20.         서재원             최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

public interface FrOrderService {
	
	/**
	 * 가맹점 주문내역 전체 조회
	 * @param pagingVO
	 * @return
	 */
	public List<FrOrderVO> retrieveFrOrderList(PagingVO<FrOrderVO> pagingVO);
	
	/**
	 * 가맹점 주문내역 상세 조회
	 * @param pagingVO
	 * @return
	 */
	public List<FrOrderVO> retrieveFrOrderDetail(String frOrderNo);
	
/*	*//**
	 * 출고 단계 1 : 출고(HEADOUT) 테이블에 데이터 추가
	 *//*
	public void createHeadout();

	*//**
	 * 출고 단계 2 : HSTOCK TBL에서 출고건의 재고 차감 
	 *//*
	public void updateHstock();
	
	*//**
	 * 출고 단계 3 : 배송상태 UPDATE
	 *//*
	public void updateShipStatus();*/
	
	/**
	 * 출고 단계 1 ~ 3
	 */
	public void headoutAll();
	
	/**
	 * 배송준비중 상태 카운트
	 * @return
	 */
	public int retrieveST09Count();
	
	/**
	 * 대시보드용 가맹점 주문건 카운트
	 * @return
	 */
	public List<FrOrderVO> retrieveOrderListDashboard();

}
