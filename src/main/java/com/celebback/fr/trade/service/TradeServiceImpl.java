package com.celebback.fr.trade.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.celebback.fr.trade.dao.TradeDAO;
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
@Service
public class TradeServiceImpl implements TradeService{
	@Inject
	TradeDAO tradeDAO;
	
	/**
	 * 트레이딩 검색 결과 조회 - /fr/tradeShop
	 */
	@Override
	public List<TradeVO> retrieveTradeSearch(PagingVO<TradeVO> pagingVO) {
		pagingVO.setTotalRecord(tradeDAO.selectTotalRecord(pagingVO));
		List<TradeVO> tradeList = tradeDAO.selectTradeSearchList(pagingVO);
		pagingVO.setDataList(tradeList);
		return tradeList;
	}
	
	/**
	 * 트레이딩 요청 수락 
	 */
	@Override
	@Transactional
	public void mergeTradeAccept(TradeVO tradeVO) {
		tradeDAO.updateTradeAccept(tradeVO); // trade 테이블 update
		tradeDAO.updateReqAccept(tradeVO);   // 요청 매장 재고+
		tradeDAO.updateRespAccept(tradeVO);// 응답 매장 재고 -
		// 요청매장청구 update  이건 한달에 한 번
		// 응답매장청구 update  이건 한달에 한 번
		
	}

	/**
	 * 트레이딩 내역 조회 - /fr/trade
	 */
	@Override
	public List<TradeVO> retrieveTradeList(PagingVO<TradeVO> pagingVO) {
		pagingVO.setTotalRecord(tradeDAO.selectTotalRecord2(pagingVO));
		List<TradeVO> tradeList = tradeDAO.selectTradeList(pagingVO);
		pagingVO.setDataList(tradeList);
		return tradeList;
	}

}
