package com.celebback.head.buyerinfo.service;

import java.util.List;
import java.util.Map;

import com.celebback.vo.BuyerVO;
import com.celebback.vo.PagingVO;

/**
 * 
 * @author 서재원
 * @since 2022. 8. 13.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 13.    서재원              최초작성
 * 2022. 8. 17.    서재원              가맹점 수정
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

public interface BuyerInfoService {
	
	/**
	 * 거래처 전체 조회
	 * @param pagingVO
	 * @return
	 */
	public List<BuyerVO> retrieveBuyerInfoList(PagingVO<BuyerVO> pagingVO);
	
	/**
	 * 거래처 수정
	 * @param buyerId
	 * @param modifyValue
	 */
	public void updateBuyerInfo(Map<String, String> map);
	

}
