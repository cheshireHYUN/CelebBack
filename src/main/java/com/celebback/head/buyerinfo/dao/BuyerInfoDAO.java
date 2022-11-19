package com.celebback.head.buyerinfo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.celebback.vo.BuyerVO;
import com.celebback.vo.PagingVO;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 서재원
 * @since 2022. 8. 12.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 12.    서재원              최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface BuyerInfoDAO {
	
	/**
	 * 거래처 전체 조회
	 * @param pagingVO
	 * @return
	 */
	public List<BuyerVO> selectBuyerList(PagingVO<BuyerVO> pagingVO);
	
	
	/**
	 * 거래처 전체 목록 페이징
	 * @param pagingVO
	 * @return
	 */
	public int selectTotalRecord(PagingVO<BuyerVO> pagingVO);


	/**
	 * 거래처 정보 수정
	 * @param buyerId
	 * @param modifyValue
	 */
	public void updateBuyerList(Map<String, String> map);

	
}
