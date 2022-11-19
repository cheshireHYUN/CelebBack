package com.celebback.fr.pay.bill.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
@Repository
public class BillDao {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.celebback.mybatis.mappers.bill";
	
	public BillVO billList (BillVO vo) {
		vo = session.selectOne(namespace+".BillList", vo);

		return vo;
	}
	
	public void billCreate (BillVO vo) {
		session.insert(namespace+".BillCreate",vo);
	}
	
	public void billUpdate (BillVO vo) {
		session.update(namespace+".BillUpdate",vo);
	}
	
	// 차트 조회
	public List<BillVO> selectBillList(BillVO vo) {
		List<BillVO> updateList = session.selectList(namespace+".BillChartList", vo);
//		System.out.println(chartList);
		return updateList;
	}

}
