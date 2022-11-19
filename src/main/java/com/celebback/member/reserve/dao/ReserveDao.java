package com.celebback.member.reserve.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.celebback.vo.FranVO;
import com.celebback.vo.MyCpnVO;
import com.celebback.vo.ResvInfoVO;
import com.celebback.vo.SitVO;

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
public class ReserveDao {
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.celebback.head.fr.dao.FrDAO";
	private static String namespace2 = "com.celebback.mybatis.mappers.reserve"; 
	
	public FranVO franTimeInfo(String franId) {
		return session.selectOne(namespace+".franTimeInfo",franId);
	}
	
	public List<String> reserveSitList(ResvInfoVO vo) {
		return session.selectList(namespace2+".reserveSitList",vo);
	}

	public List<MyCpnVO> myUnusedCpn(String memId) {
		return session.selectList(namespace2+".myUnusedCpn",memId);
	}

	public void resvSave(ResvInfoVO vo) {
		session.insert(namespace2+".resvSave",vo);
	}
	
	public String getMorderId() {
		return session.selectOne(namespace2+".getMorderId");
	}
	
	public void morderSave(ResvInfoVO vo) {
		session.insert(namespace2+".morderSave",vo);
	}
	
	public void paySave(ResvInfoVO vo) {
		session.insert(namespace2+".paySave",vo);
	}
	public void paySave2(ResvInfoVO vo) {
		session.insert(namespace2+".paySave2",vo);
	}

	public void useCpn(ResvInfoVO vo) {
		session.insert(namespace2+".useCpn",vo);
	}
	
	public void updateStamp(ResvInfoVO vo) {
		session.update(namespace2+".updateStamp",vo);
	}
}
