package com.celebback.fr.info.menu.service;

import java.util.List;

import org.springframework.security.core.Authentication;

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
public interface FrMenuService {
	
	// 본사의 메뉴리스트
	public List<FrMenuVO> menuList(Authentication authentication);
	
	// 가맹점의 메뉴리스트
	public List<MenuVO> frMenuList(Authentication authentication);
	// 멤버가 조회하는 메뉴리스트
	public List<MenuVO> frMenuListMember(String franId);
	
	// 가맹점 메뉴 업데이트
	public void frMenuUpdate(FrMenuVO vo, Authentication authentication);


}
