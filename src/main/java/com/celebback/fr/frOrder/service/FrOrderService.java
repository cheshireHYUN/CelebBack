package com.celebback.fr.frOrder.service;
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
import java.util.Map;

import com.celebback.vo.FrOrderVO;
import com.celebback.vo.PagingVO;

public interface FrOrderService {
	
	// 발주제품 조회
	public List<FrOrderVO> retieveProdOrderList(PagingVO<FrOrderVO> pagingVO);
	
	// 발주내역 조회
	public List<FrOrderVO> retrieveOrderList(PagingVO<FrOrderVO> pagingVO);
	
	// 발주내역 상세조회
	public List<FrOrderVO> retrieveOrder(String frOrderNo);
	
	// 발주등록
	public void createOrder(FrOrderVO vo);
	
	//fran_id 구하기
	public String retrieveFranId(String authName);

	//frOrderNo 구하기
	public String retrieveOrderNo();
	
	//발주완료시 내역조회
	public FrOrderVO retrieveScOrder(FrOrderVO vo);
	
	// 발주취소
	public void deleteOrder(String frOrderNo);
	
	// 주문확정하기위해 select 해오는 값
	public List<FrOrderVO> retrieveConfirmOrder(FrOrderVO vo);
	
	// 주문확정(트랜잭션)
	public void createConfirmOrder(FrOrderVO confirmList);
//	public void modifyConfirmOrder(String frOrderNo);
//	public void modifyFrStockOrder(FrOrderVO confirmList);

	
}
