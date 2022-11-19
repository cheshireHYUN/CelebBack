package com.celebback.head.prodstock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.celebback.head.prodstock.dao.ProdStockDAO;
import com.celebback.vo.HStockVO;
import com.celebback.vo.PagingVO;
import com.celebback.vo.ProdHeadOutDetailVO;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 서재원
 * @since 2022. 8. 24.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 24.         서재원             최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Service
@Slf4j
public class ProdStockServiceImpl implements ProdStockService {
	
	@Inject
	ProdStockDAO prodStockDAO;

	/**
	 * 제품재고 전체조회
	 */
	@Override
	public List<HStockVO> retrieveProdStockList(PagingVO<HStockVO> pagingVO) {
		pagingVO.setTotalRecord(prodStockDAO.selectTotalRecord(pagingVO));
		List<HStockVO> prodStockList = prodStockDAO.selectProdStockList(pagingVO);
		pagingVO.setDataList(prodStockList);
		return prodStockList;
	}

	@Override
	public List<ProdHeadOutDetailVO> retrieveProdStockDetail(String buyerprodId) {
		List<ProdHeadOutDetailVO> prodStockDetail = prodStockDAO.selectProdStockDetail(buyerprodId);
		return prodStockDetail;
	}

}
