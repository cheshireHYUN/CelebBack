package com.celebback.fr.trade.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.celebback.vo.FranVO;
import com.celebback.vo.PagingVO;
import com.celebback.vo.TradeVO;
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
@Mapper
public interface TradeDAO {
	/**
	 * 트레이딩 검색 결과 조회
	 * @param pagingVO
	 * @return
	 */
	public List<TradeVO> selectTradeSearchList(PagingVO<TradeVO> pagingVO);
	
	/**
	 * 트레이딩 검색 결과 페이징
	 * @param pagingVO
	 * @return
	 */
	public int selectTotalRecord(PagingVO<TradeVO> pagingVO);
	
	/**
	 * 트레이딩 요청
	 * @param tradeVO
	 * @return
	 */
	public int insertTrade(TradeVO tradeVO);
	
	/**
	 * 트레이딩 요청 현황 - 발신
	 * @param authName
	 * @return
	 */
	public List<TradeVO> selectTradeReqList(String authName);
	
	/**
	 * 트레이딩 요청 현황 - 수신
	 * @param authName
	 * @return
	 */
	public List<TradeVO> selectTradeRespList(String authName);
	
	/**
	 * 트레이딩 요청 수락
	 * @param tradeVO
	 * @return
	 */
	public void updateTradeAccept(TradeVO tradeVO);
	
	/**
	 * 트레이딩 요청 수락 - 요청 매장 재고 (+)
	 * @param tradeVO
	 */
	public void updateReqAccept(TradeVO tradeVO);
	
	/**
	 * 트레이딩 요청 수락 - 응답 매장 재고 (-)
	 * @param tradeVO
	 */
	public void updateRespAccept(TradeVO tradeVO);
	
	/**
	 * 트레이딩 요청 거절
	 * @param tradeVO
	 */
	public void updateTradeReject(TradeVO tradeVO);
	
	/**
	 * 트레이딩 요청 취소
	 * @param tradeNo
	 */
	public void deleteTrade(String tradeNo);
	
	/**
	 * 트레이딩 지도 조회
	 * @param tradeVO
	 * @return
	 */
	public List<FranVO> selectMap(PagingVO<TradeVO> pagingVO);

	/**
	 * 트레이딩 내역 조회
	 * @param pagingVO
	 * @return
	 */
	public List<TradeVO> selectTradeList(PagingVO<TradeVO> pagingVO);

	/**
	 * 트레이딩 내역 페이징
	 * @param pagingVO
	 * @return
	 */
	public int selectTotalRecord2(PagingVO<TradeVO> pagingVO);
	
	/**
	 * 재료명 단순 조회
	 * @return
	 */
	public List<Map<String, Object>> selectFoodList();
}
