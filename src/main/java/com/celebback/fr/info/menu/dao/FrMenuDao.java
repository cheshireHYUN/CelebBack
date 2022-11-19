package com.celebback.fr.info.menu.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.celebback.vo.FrMenuVO;
import com.celebback.vo.MenuVO;

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
public class FrMenuDao {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.celebback.mybatis.mappers.frInfo";

	public List<FrMenuVO> menuList(String franId) {
		return session.selectList(namespace+".menuList",franId);
	}

	public List<MenuVO> frMenuList(String franId) {
		return session.selectList(namespace+".frMenuList", franId);
	}
	
	public void frmenuDelete(String franId) {
		session.delete(namespace+".frMenuDelete", franId);
	}
	

	public void frMenuInsert(FrMenuVO vo) {
		session.insert(namespace+".frMenuInsert",vo);
	}
	
	
}
