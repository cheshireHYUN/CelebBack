package com.celebback.head.menu.service;

import java.util.List;

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

public interface MenuService {
	
	public void createMenu(MenuVO menu, MaterialVO material) throws Exception;
	
	public List<MenuVO> retrieveMenuList() throws Exception;
	
	public void updateMenu(MenuVO menu) throws Exception;
	
	public void deleteMenu(String menuId) throws Exception;
	
	public String getMenuId(String menuName) throws Exception;
	
	public void createMaterial(MaterialVO vo) throws Exception;

	public List<HStockVO> getHStockList() throws Exception;
	

}
