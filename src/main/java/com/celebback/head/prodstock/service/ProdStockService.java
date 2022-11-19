package com.celebback.head.prodstock.service;

import java.util.List;

import com.celebback.vo.HStockVO;
import com.celebback.vo.PagingVO;
import com.celebback.vo.ProdHeadOutDetailVO;

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
public interface ProdStockService {
	
	/**
	 * 제품재고 전체 조회
	 * @param pagingVO
	 * @return
	 */
	public List<HStockVO> retrieveProdStockList(PagingVO<HStockVO> pagingVO);

	/**
	 * 제품재고 상세 조회
	 * @param frOrderNo
	 * @return
	 */
	public List<ProdHeadOutDetailVO> retrieveProdStockDetail(String buyerprodId);
}
