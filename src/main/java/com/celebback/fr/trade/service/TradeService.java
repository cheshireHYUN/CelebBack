package com.celebback.fr.trade.service;
/**
 * 
 * @author 황단비
 * @since 2022. 8. 23.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자            수정내용
 * --------     --------    ----------------------
 * 2022. 8. 23.       황단비      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

import java.util.List;

import com.celebback.vo.PagingVO;
import com.celebback.vo.TradeVO;

public interface TradeService {
	/**
	 * 트레이딩 검색 결과 조회
	 * @param pagingVO
	 * @return
	 */
	public List<TradeVO> retrieveTradeSearch(PagingVO<TradeVO> pagingVO);
	
	/**
	 * 트레이딩 요청 수락
	 * @param tradeVO
	 */
	public void mergeTradeAccept(TradeVO tradeVO);
	
	/**
	 * 트레이딩 내역 조회
	 * @param pagingVO
	 * @return
	 */
	public List<TradeVO> retrieveTradeList(PagingVO<TradeVO> pagingVO);
}
