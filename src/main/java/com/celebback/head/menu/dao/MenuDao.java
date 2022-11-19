package com.celebback.head.menu.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.celebback.vo.HStockVO;
import com.celebback.vo.MaterialVO;
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
 * 2022. 8. 9.       최서현      CRUD 작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Repository
public class MenuDao {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.celebback.mybatis.mappers.menu";
	
	public List<HStockVO> getHStock() throws Exception {
		return session.selectList(namespace+".getHStock");
	}
	
	public void create(MenuVO vo) throws Exception{
		session.insert(namespace+".create",vo);
	}
	
	public void createImg(MenuVO vo) throws Exception{
		session.insert(namespace+".createImg",vo);
	}
	
	public List<MenuVO> listAll() throws Exception{ 
		return session.selectList(namespace+".listAll");
	}
	
	public void update(MenuVO vo) throws Exception {
		session.update(namespace+".update",vo);
	}
	
	public void delete(String menuId) throws Exception {
		session.delete(namespace+".delete",menuId);
	}

	public String getMenuId(String menuName) throws Exception {
		return session.selectOne(namespace+".getMenuId",menuName);
	}
	
	public void createMaterial(MaterialVO vo) throws Exception{
		session.insert(namespace+".createMaterial",vo);
	}

	public void deleteMaterial(String menuId) throws Exception {
		session.delete(namespace+".deleteMaterial",menuId);
	}
	
	public void deleteFranMenu(String menuId) throws Exception {
		session.delete(namespace+".deleteFranMenu",menuId);
	}
	
	public void deleteImg(String menuId) throws Exception {
		session.delete(namespace+".deleteImg",menuId);
	}
}
