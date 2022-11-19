package com.celebback.member.reserve.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.celebback.member.reserve.dao.ReserveDao;
import com.celebback.vo.FranVO;
import com.celebback.vo.MyCpnVO;
import com.celebback.vo.ResvInfoVO;

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
public class ReserveServiceImpl implements ReserveService{

	@Inject
	ReserveDao dao;
	
	@Override
	public FranVO franTimeInfo(String franId) {
		FranVO vo = dao.franTimeInfo(franId);
		
		int idx = vo.getFranEntime().indexOf(":");
		vo.setFranEntimeInt(Integer.parseInt(vo.getFranEntime().substring(0,idx)));
		
		idx = vo.getFranSttime().indexOf(":");
		vo.setFranSttimeInt(Integer.parseInt(vo.getFranSttime().substring(0,idx)));
		
		idx = vo.getFranBsttime().indexOf(":");
		vo.setFranBsttimeInt(Integer.parseInt(vo.getFranBsttime().substring(0,idx)));
		
		idx = vo.getFranBentime().indexOf(":");
		vo.setFranBentimeInt(Integer.parseInt(vo.getFranBentime().substring(0,idx)));
		
		return vo;
	}

	@Override
	public List<MyCpnVO> myUnusedCpn(String memId) {
		return dao.myUnusedCpn(memId);
	}

	@Override
	@Transactional
	public void resvAndMorderSave(ResvInfoVO vo) {
		// 시간 형식 변경
		vo.setTime(vo.getTime()+":00");
		if((vo.getMonth()).length() == 1) {
			vo.setMonth("0"+vo.getMonth());
		};
		if((vo.getDay()).length() == 1) {
			vo.setDay("0"+vo.getDay());
		};
		// 예약일 설정
		vo.setResvDate(vo.getYear()+vo.getMonth()+vo.getDay());
		
		dao.resvSave(vo);
		
		vo.setMorderId(dao.getMorderId());
		
		// 메뉴 형식 나눠주기 - 메뉴별로 주문테이블에 저장해야하므로!
		List<String> list = vo.getResvMenu(); 
		for(String item : list) {
			String[] array = item.split(";");
			vo.setMenuId(array[0]);
			vo.setMorderQty(array[1]);
			vo.setMorderPrice(Integer.toString(Integer.parseInt(array[2])*Integer.parseInt(array[1])));
			dao.morderSave(vo);
		}
		
		// 선결제의 경우 PAY테이블에도 넣어줘야한다.
		if(vo.getPayallYn().equals("Y")) {
			// (#{morderId}, #{totalPrice}, SYSDATE, #{mycpnId})
			dao.paySave(vo);
			dao.useCpn(vo);
		}
/*		else{
			// 후붛결제면 이렇게 넣음(임시)
			dao.paySave2(vo);
		}*/
		dao.updateStamp(vo);
		

	}

	@Override
	public List<String> reserveSitList(ResvInfoVO vo) {
		return dao.reserveSitList(vo);
	}

}
