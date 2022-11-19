package com.celebback.fr.frStock.service;
/**
 * 
 * @author 이혜원
 * @since 2022. 8. 10.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 10.       이혜원      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

import java.util.HashMap;
import java.util.List;

import com.celebback.vo.FrStockVO;
import com.celebback.vo.FranVO;
import com.celebback.vo.PagingVO;

public interface FrStockService {
	
	// 재고현황 조회
	public List<FrStockVO> retrieveFrStockList(PagingVO<FrStockVO> pagingVO);
	
	// 재고수정
	public void modifyFrStock(HashMap<String, String> atOrderMap);

}
