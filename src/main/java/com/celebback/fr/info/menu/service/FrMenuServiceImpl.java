package com.celebback.fr.info.menu.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.celebback.board.frNotice.dao.FrNoticeDAO;
import com.celebback.fr.info.menu.dao.FrMenuDao;
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

@Service
public class FrMenuServiceImpl implements FrMenuService{
	
	@Inject
	FrMenuDao dao;
	
	@Inject
	FrNoticeDAO frNoticeDao;

	@Override
	public List<FrMenuVO> menuList(Authentication authentication) {
		String ownerId = authentication.getName();
		String franId = (frNoticeDao.selectFranId(ownerId));
		return dao.menuList(franId);
		
	}

	@Override
	public List<MenuVO> frMenuList(Authentication authentication) {
		String ownerId = authentication.getName();
		String franId = (frNoticeDao.selectFranId(ownerId));
		return dao.frMenuList(franId);
	}
	
	@Override
	public List<MenuVO> frMenuListMember(String franId) {
		return dao.frMenuList(franId);
	}

	@Override
	@Transactional
	public void frMenuUpdate(FrMenuVO vo, Authentication authentication) {
		String ownerId = authentication.getName();
		String franId = (frNoticeDao.selectFranId(ownerId));
		vo.setFranId(franId);
		dao.frmenuDelete(vo.getFranId());
		List<String> menuIdList = vo.getMenuIdList();
		for(int i=0; i<menuIdList.size(); i++) {
			String menuId = menuIdList.get(i);
			vo.setMenuId(menuId);
			dao.frMenuInsert(vo);
		}
		
	}

}
