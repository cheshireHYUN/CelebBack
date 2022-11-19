package com.celebback.fr.frStock.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.celebback.fr.frStock.dao.FrStockDAO;
import com.celebback.vo.FrStockVO;
import com.celebback.vo.FranVO;
import com.celebback.vo.PagingVO;
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
@Service
public class FrStockServiceImpl implements FrStockService{
	@Inject
	FrStockDAO frStockDAO;
	
	/**
	 * 재고현황조회
	 */
	@Override
	public List<FrStockVO> retrieveFrStockList(PagingVO<FrStockVO> pagingVO) {
		List<FrStockVO> frStockList = frStockDAO.selectFrStockList(pagingVO);
		pagingVO.setDataList(frStockList);
		return frStockList;
	}
	
	/**
	 * 재고수정
	 */
	@Override
	public void modifyFrStock(HashMap<String, String> frStockMap) {
		frStockDAO.updateFrStock(frStockMap);
		
	}


}
