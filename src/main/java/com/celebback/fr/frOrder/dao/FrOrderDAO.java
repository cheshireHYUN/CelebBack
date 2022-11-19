package com.celebback.fr.frOrder.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.celebback.vo.FrOrderVO;
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
@Mapper
public interface FrOrderDAO {
	
	/**
	 * 발주제품 조회
	 * @return
	 */
	public List<FrOrderVO> selectProdOrderList(PagingVO<FrOrderVO> pagingVO);
	
	/**
	 * 발주내역 조회
	 * @param pagingVO
	 * @return
	 */
	public List<FrOrderVO> selectOrderList(PagingVO<FrOrderVO> pagingVO);
	
	/**
	 * 발주내역 페이징
	 * @param pagingVO
	 * @return
	 */
	public int selecTotalRecord(PagingVO<FrOrderVO> pagingVO);
	
	/**
	 * 발주내역 상세조회
	 * @param frOrderNo
	 * @return
	 */
	public List<FrOrderVO> selectOrder(String frOrderNo);
	
	/**
	 * 발주등록
	 * @param frOrder
	 * @return
	 */
	public int inserOrder(FrOrderVO vo);
	
	/**
	 * franId 구하기
	 * @param authName
	 * @return
	 */
	public String selectFranId(String authName);
	
	/**
	 * frOrderNo 구하기
	 * @param authName
	 * @return
	 */
	public String selectOrderNo();
	
	/**
	 * 발주완료시 내역조회
	 * @param authName
	 * @return
	 */
	public FrOrderVO selectScOrder(FrOrderVO vo);
	
	/**
	 * 발주취소
	 * @param frOrderNo
	 * @return
	 */
	public int deleteOrder(String frOrderNo);
	
	/**
	 * 주문확정하기위해 select 해오는 값
	 * @param conOrderMap
	 * @return
	 */
	public List<FrOrderVO> selectConfirmOrder(FrOrderVO vo);
	
	
	/**
	 * 주문확정
	 * @param orderMap
	 * @return
	 */
	public int insertConfirmOrder(FrOrderVO confirmList);
	public int updateConfirmOrder(FrOrderVO confirmList);
	public int updateFrStockOrder (FrOrderVO confirmList);
	
	
}
