package com.celebback.fr.pay.fee.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import com.celebback.board.frNotice.dao.FrNoticeDAO;
import com.celebback.fr.pay.fee.dao.FeeDao;
import com.celebback.vo.FeePayVO;
import com.celebback.vo.FrFeeDetailVO;
import com.celebback.vo.FrFeeVO;

/**
 * 
 * @author 최서현
 * @since 2022. 8. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 5.       최서현      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Service
public class FeeServiceImpl implements FeeService {
	@Inject
	FeeDao dao;
	
	@Inject
	FrNoticeDAO frNoticeDao;

	@Override
	public FrFeeVO feeList(FrFeeVO vo, Authentication authentication) {
		String ownerId = authentication.getName();
		vo.setFranId(frNoticeDao.selectFranId(ownerId));
		
		if(dao.feeList(vo) != null) { 
			vo = dao.feeList(vo);
		}
		// 만약 fee테이블에 정보가 없을경우 pay테이블에서 fee기본키로 조회가 불가능 하므로
		if(vo.getFeeId() != null) {
			vo.setFeepayDate(dao.feePay(vo));			
		}
		
		return vo;
	}

	@Override
	public List<FrFeeDetailVO> feeDetailList(FrFeeDetailVO vo, Authentication authentication) {
		String ownerId = authentication.getName();
		vo.setFranId(frNoticeDao.selectFranId(ownerId));
			
		List<FrFeeDetailVO> dlist = new ArrayList<>();
		FrFeeDetailVO vo2 = new FrFeeDetailVO();
		vo2.setTarget("none");
		
		switch (vo.getTarget()) {
		case "feeRoyal":
			dlist = dao.feeRoyal(vo);
			if(dlist.isEmpty()) {
				dlist.add(vo2);
			}
			break;
			
		case "feeCost":
			dlist =  dao.feeCost(vo);
			if(dlist.isEmpty()) {
				dlist.add(vo2);
			}
			break;
			
		case "feeTplus":
			dlist = dao.feeTplus(vo);
			if(dlist.isEmpty()) {
				dlist.add(vo2);
			}
			break;
			
		case "feeTminus":
			dlist =  dao.feeTminus(vo);
			if(dlist.isEmpty()) {
				dlist.add(vo2);
			}
			break;
			
		case "feeCpn":
			dlist =  dao.feeCpn(vo);
			if(dlist.isEmpty()) {
				dlist.add(vo2);
			}
			break;
		}
		
		return dlist;
	}

	@Override
	public void feePay(FeePayVO vo, Authentication authentication) {
		String ownerId = authentication.getName();
		vo.setFranId(frNoticeDao.selectFranId(ownerId));
		 dao.feePayOk(vo);
	}
	
	
	
}
