package com.celebback.head.buyerpurchase.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

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
 * 2022. 8. 17.         서재원             최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Mapper
public interface BuyerPurchaseDAO {
	
	/**
	 * 거래처 매입내역 전체 조회
	 * @param pagingVO
	 * @return
	 */
	public List<HeadinVO> selectBuyerPurchaseList(PagingVO<HeadinVO> pagingVO);
	
	
	/**
	 * 거래처 매입내역 전체 목록 페이징
	 * @param pagingVO
	 * @return
	 */
	public int selectTotalRecord(PagingVO<HeadinVO> pagingVO);
	
	/**
	 * 거래처 매입내역 추가
	 * @param map
	 */
	public void createBuyerPurchase(Map<String, Object> map);
	
	/**
	 * 현재고 추가 또는 업데이트 (없으면 insert, 있으면 update)
	 * @param map
	 */
	public void updateHstock(Map<String, Object> map);

	/**
	 * 옵션조회용
	 * @return
	 */
	public List<HeadinVO> selectOptionList();

	/**
	 * 옵션조회용2
	 * @return
	 */
	public List<HeadinVO> selectOptionList2(String buyerId);
	
	/**
	 * 입고단가조회용
	 * @return
	 */
	public Integer selectBuyerprodPrice(String buyerprodId);
	
	
}
