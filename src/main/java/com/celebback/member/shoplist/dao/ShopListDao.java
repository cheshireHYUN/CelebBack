package com.celebback.member.shoplist.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.celebback.vo.FrPageVO;
import com.celebback.vo.FranVO;

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
public class ShopListDao {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.celebback.head.fr.dao.FrDAO";
	
	public int totalPage() {
		return session.selectOne(namespace+".totalPage");
	}
	
	public List<FranVO> shopList(FrPageVO vo) {
		return session.selectList(namespace+".franListPage",vo);
	}

}
