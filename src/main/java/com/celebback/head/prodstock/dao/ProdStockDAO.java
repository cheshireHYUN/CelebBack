package com.celebback.head.prodstock.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

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

@Mapper
public interface ProdStockDAO {
	
	/**
	 * 제품재고정보 전체조회
	 * @param pagingVO
	 * @return
	 */
	public List<HStockVO> selectProdStockList(PagingVO<HStockVO> pagingVO);
	
	/**
	 * 제품재고정보 전체 목록 페이징 
	 * @param pagingVO
	 * @return
	 */
	public int selectTotalRecord(PagingVO<HStockVO> pagingVO);
	
	/**
	 * 제품재고정보 상세조회
	 * @param buyerprodId
	 * @return
	 */
	public List<ProdHeadOutDetailVO> selectProdStockDetail(String buyerprodId);
	

}
