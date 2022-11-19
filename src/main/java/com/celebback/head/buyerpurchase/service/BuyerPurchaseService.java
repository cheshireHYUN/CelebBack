package com.celebback.head.buyerpurchase.service;

import java.util.List;
import java.util.Map;

import com.celebback.vo.HeadinVO;
import com.celebback.vo.PagingVO;

/**
 * 
 * @author 서재원
 * @since 2022. 8. 17.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 17.    서재원             최초작성
 * 2022. 8. 19.    서재원             거래처 매입내역 create
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
public interface BuyerPurchaseService {

	/**
	 * 거래처 매입내역 전체 조회
	 * @param pagingVO
	 * @return
	 */
	public List<HeadinVO> retrieveBuyerPurchaseList(PagingVO<HeadinVO> pagingVO);
	
	/**
	 * 거래처 매입내역 추가 및 현재고 업데이트
	 * @param map
	 */
	public void createBuyerPurchase(Map<String, Object> map);
	
	/**
	 * 옵션 리스트 조회(리팩토링)를 위한 서비스
	 * @return
	 */
	public List<HeadinVO> retrieveOptionList();
	
	/**
	 * 옵션 리스트 조회(리팩토링)를 위한 서비스2
	 * @return
	 */
	public List<HeadinVO> retrieveOptionList2(String buyerId);
	
	/**
	 * 입고단가 조회
	 * @param buyerprodId
	 * @return
	 */
	public Integer retrieveBuyerprodPrice(String buyerprodId);
	
}
