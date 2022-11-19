package com.celebback.head.buyerpurchase.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.celebback.head.buyerpurchase.dao.BuyerPurchaseDAO;
import com.celebback.vo.HeadinVO;
import com.celebback.vo.PagingVO;

import lombok.extern.slf4j.Slf4j;

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

@Service
@Slf4j
public class BuyerPurchaseServiceImpl implements BuyerPurchaseService {
	
	@Inject
	BuyerPurchaseDAO buyerPurchaseDAO;	

	/**
	 * 거래처 매입내역 전체 조회
	 */
	@Override
	public List<HeadinVO> retrieveBuyerPurchaseList(PagingVO<HeadinVO> pagingVO) {
		pagingVO.setTotalRecord(buyerPurchaseDAO.selectTotalRecord(pagingVO));
		List<HeadinVO> buyerPurchaseList = buyerPurchaseDAO.selectBuyerPurchaseList(pagingVO);
		pagingVO.setDataList(buyerPurchaseList);
		return buyerPurchaseList;
	}

	@Override
	public void createBuyerPurchase(Map<String, Object> map) {
		
		log.info("서비스단 시작");
		log.info("{}", map);
		log.info("서비스단 끝");
		
		buyerPurchaseDAO.createBuyerPurchase(map);
		buyerPurchaseDAO.updateHstock(map);
	}

	@Override
	public List<HeadinVO> retrieveOptionList() {
		List<HeadinVO> optionList = buyerPurchaseDAO.selectOptionList();
		return optionList;
	}

	@Override
	public List<HeadinVO> retrieveOptionList2(String buyerId) {
		List<HeadinVO> optionList2 = buyerPurchaseDAO.selectOptionList2(buyerId);
		return optionList2;
	}

	@Override
	public Integer retrieveBuyerprodPrice(String buyerprodId) {
		Integer price = buyerPurchaseDAO.selectBuyerprodPrice(buyerprodId);
		return price;
	}

}
