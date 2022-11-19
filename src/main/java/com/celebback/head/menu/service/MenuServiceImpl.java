package com.celebback.head.menu.service;

import java.sql.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.celebback.head.menu.dao.MenuDao;
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

@Service
public class MenuServiceImpl implements MenuService{
 
	@Inject
	private MenuDao dao;
	
	@Override
	@Transactional
	public void createMenu(MenuVO menu, MaterialVO material) throws Exception {
		
		dao.create(menu);
		String menuId = dao.getMenuId(menu.getMenuName());

		dao.createImg(menu);
		// 입력한 메뉴의 재료정보를 재료테이블에 등록해야함
		// 따라서 방금 등록한 메뉴테이블의 메뉴아이디를 get해온 뒤
		// 고기,야채,우유 이런식으로 입력받은 String데이터를 split해 재료테이블에 넣는다.
		
		String[] buyerprodIdArray = material.getBuyerprodId().split(",");
		for (int i=0; i<buyerprodIdArray.length; i++) {
			System.out.println("콤마를 기준으로 자른 아이디:"+buyerprodIdArray[i]);
			material.setMenuId(menuId);
			material.setBuyerprodId(buyerprodIdArray[i]);
			dao.createMaterial(material);
		}
		
		
	}

	@Override
	public List<MenuVO> retrieveMenuList() throws Exception {
		return dao.listAll();
	}

	@Override
	public void updateMenu(MenuVO menu) throws Exception {
		dao.update(menu);
	}

	@Override
	@Transactional
	public void deleteMenu(String menuId) throws Exception {
		dao.deleteMaterial(menuId);
		dao.deleteImg(menuId);
		dao.deleteFranMenu(menuId);
		dao.delete(menuId);
	}

	@Override
	public String getMenuId(String menuName) throws Exception {
		return dao.getMenuId(menuName); 
	}

	@Override
	public void createMaterial(MaterialVO vo) throws Exception {
		dao.createMaterial(vo);
		
	}

	@Override
	public List<HStockVO> getHStockList() throws Exception {
		return dao.getHStock();
	}

}
