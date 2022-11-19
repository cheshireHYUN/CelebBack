package com.celebback.fr.pay.fee.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.celebback.board.frNotice.dao.FrNoticeDAO;
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
@Repository
public class FeeDao {
	
	@Inject
	private SqlSession session;
	
	@Inject
	FrNoticeDAO frNoticeDao;
	
	private static String namespace = "com.celebback.mybatis.mappers.frfee";
	
	public FrFeeVO feeList(FrFeeVO vo) {
		return session.selectOne(namespace+".readFee",vo);
	}
	public String feePay(FrFeeVO vo) {
		return session.selectOne(namespace+".feePay",vo);
	}
	
	public List<FrFeeDetailVO> feeRoyal(FrFeeDetailVO vo) { 
		return session.selectList(namespace+".feeRoyal",vo);
	}
	public List<FrFeeDetailVO> feeCost(FrFeeDetailVO vo) {
		return session.selectList(namespace+".feeCost",vo);
	}
	public List<FrFeeDetailVO> feeTminus(FrFeeDetailVO vo) {
		return session.selectList(namespace+".feeTminus",vo);
	}
	public List<FrFeeDetailVO> feeTplus(FrFeeDetailVO vo) {
		return session.selectList(namespace+".feeTplus",vo);
	}
	public List<FrFeeDetailVO> feeCpn(FrFeeDetailVO vo) {
		return session.selectList(namespace+".feeCpn",vo);
	}
	public void feePayOk(FeePayVO vo) {
		System.out.println("DAO");
		session.insert(namespace+".feePayOk",vo);
		System.out.println("DAO22");
	}

}
