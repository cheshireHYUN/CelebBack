package com.celebback.fr.frOrder.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.celebback.fr.frOrder.dao.FrOrderDAO;
import com.celebback.vo.FrOrderVO;
import com.celebback.vo.FrStockVO;
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
public class FrOrderServiceImpl implements FrOrderService {
	@Inject
	FrOrderDAO frOrderDAO;
	
	/**
	 * 발주제품 조회
	 */
	@Override
	public List<FrOrderVO> retieveProdOrderList(PagingVO<FrOrderVO> pagingVO) {
		List<FrOrderVO> prodOrderList = frOrderDAO.selectProdOrderList(pagingVO);
		pagingVO.setDataList(prodOrderList);
		return prodOrderList;
	}

	/**
	 * 발주내역 조회
	 */
	@Override
	public List<FrOrderVO> retrieveOrderList(PagingVO<FrOrderVO> pagingVO) {
		pagingVO.setTotalRecord(frOrderDAO.selecTotalRecord(pagingVO));
		List<FrOrderVO> orderList = frOrderDAO.selectOrderList(pagingVO);
		pagingVO.setDataList(orderList);
		return orderList;
	}
	
	/**
	 * 발주내역 상세조회
	 */
	@Override
	public List<FrOrderVO> retrieveOrder(String frOrderNo) {
		List<FrOrderVO> orderDetail = frOrderDAO.selectOrder(frOrderNo);
		return orderDetail;
	}
	/**
	 * 발주등록
	 */
	@Override
	public void createOrder(FrOrderVO vo) {
		frOrderDAO.inserOrder(vo);
	}

	/**
	 * franId 구하기
	 */
	@Override
	public String retrieveFranId(String authName) {
		String franId = frOrderDAO.selectFranId(authName);
		return franId;
	}

	/**
	 * frOrderNo 구하기
	 */
	@Override
	public String retrieveOrderNo() {
		String frOrderNo = frOrderDAO.selectOrderNo();
		return frOrderNo;
	}
	
	/**
	 * 발주완료시 내역조회
	 */
	@Override
	public FrOrderVO retrieveScOrder(FrOrderVO vo) {
		FrOrderVO scOrder = frOrderDAO.selectScOrder(vo);
		return scOrder;
	}
	
	/**
	 * 발주취소
	 */
	@Override
	public void deleteOrder(String frOrderNo) {
		frOrderDAO.deleteOrder(frOrderNo);
	}

	/**
	 * 주문확정하기위해 select 해오는 값
	 * @return 
	 */
	@Override
	public List<FrOrderVO> retrieveConfirmOrder(FrOrderVO vo) {
		List<FrOrderVO> confirmNum = frOrderDAO.selectConfirmOrder(vo);
		return confirmNum;
	}
	
	/**
	 * 주문확정(트랜잭션)
	 * @param conOrderMap
	 */
	@Override
	@Transactional
	public void createConfirmOrder(FrOrderVO confirmList) {
		frOrderDAO.insertConfirmOrder(confirmList);
		frOrderDAO.updateConfirmOrder(confirmList);
		frOrderDAO.updateFrStockOrder(confirmList);
	}
//	@Override
//	public void modifyConfirmOrder(String frOrderNo) {
//		frOrderDAO.updateConfirmOrder(frOrderNo);
//	}
//	@Override
//	public void modifyFrStockOrder(FrOrderVO confirmList) {
//		frOrderDAO.updateFrStockOrder(confirmList);
//	}
	
	
	
}
