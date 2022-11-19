package com.celebback.head.buyerinfo.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.celebback.head.buyerinfo.dao.BuyerInfoDAO;
import com.celebback.vo.BuyerVO;
import com.celebback.vo.PagingVO;

import lombok.extern.slf4j.Slf4j;

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
 * 2022. 8. 13.         서재원             최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Service
@Slf4j
public class BuyerInfoServiceImpl implements BuyerInfoService {
	
	@Inject
	BuyerInfoDAO buyerDAO;

	/**
	 * 가맹점 전체 조회
	 */
	@Override
	public List<BuyerVO> retrieveBuyerInfoList(PagingVO<BuyerVO> pagingVO) {
		pagingVO.setTotalRecord(buyerDAO.selectTotalRecord(pagingVO));
		List<BuyerVO> buyerList = buyerDAO.selectBuyerList(pagingVO);
		pagingVO.setDataList(buyerList);
		return buyerList;
	}

	@Override
	public void updateBuyerInfo(Map<String, String> map) {
		
		log.info("----서비스단----");
		log.info("----서비스단 끝----");
		
		buyerDAO.updateBuyerList(map);

		
	}





}
