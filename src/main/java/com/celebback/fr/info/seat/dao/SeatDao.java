package com.celebback.fr.info.seat.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
public class SeatDao {
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.celebback.mybatis.mappers.frInfo";

	public void sitInsert(SitVO vo) {
		session.insert(namespace+".sitInsert",vo);
	}
	
	public List<SitVO> sitList(String franId) {
		return session.selectList(namespace+".sitList",franId);
	}
	
	public void sitDelete(SitVO vo) {
		session.delete(namespace+".sitDelete",vo);
	}


}
