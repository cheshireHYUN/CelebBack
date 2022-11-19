package com.celebback.fr.pay.bill.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import com.celebback.board.frNotice.dao.FrNoticeDAO;
import com.celebback.fr.pay.bill.dao.BillDao;
import com.celebback.vo.BillVO;

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
public class BillServiceImpl implements BillService{
	
	@Inject
	BillDao dao;
	@Inject
	FrNoticeDAO frNoticeDao;
	

	@Override
	public BillVO billList(BillVO vo,  Authentication authentication) {
		String ownerId = authentication.getName();
		String franId = (frNoticeDao.selectFranId(ownerId));
		vo.setFranId(franId);
		vo = dao.billList(vo);
		if(vo == null) {
			BillVO vo2 = new BillVO();
			vo2.setBillNo("0");
			vo2.setFranId("0");
			vo2.setBillCost(0);
			vo2.setBillDate("0");
			vo2.setSelectedDate("0");
			vo = vo2;
		}
		return vo;
	}

	@Override
	public void billCreate(BillVO vo,Authentication authentication) {
		String ownerId = authentication.getName();
		String franId = (frNoticeDao.selectFranId(ownerId));
		vo.setFranId(franId);
		dao.billCreate(vo);
	}

	@Override
	public void billUpdate(BillVO vo) {
		dao.billUpdate(vo);
	}

	// 차트 조회
	@Override
	public List<BillVO> retrieveBillList(BillVO vo) {
		List<BillVO> updateList = dao.selectBillList(vo);
		return updateList;
	}

}
