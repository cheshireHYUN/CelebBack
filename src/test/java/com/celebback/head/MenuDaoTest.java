package com.celebback.head;


import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.celebback.head.menu.dao.MenuDao;
import com.celebback.vo.MenuVO;

@RunWith(SpringRunner.class)
@ContextHierarchy({
	@ContextConfiguration("file:src/main/resources/com/celebback/spring/*-context.xml")
	, @ContextConfiguration("file:webapp/WEB-INF/spring/appServlet/servlet-context.xml")
})
@WebAppConfiguration("file:webapp")
public class MenuDaoTest {
	
	private static Logger logger = LoggerFactory.getLogger(MenuDaoTest.class);
	
	@Inject
	private MenuDao dao;
	
	@Test
	public void listAll() throws Exception {
		dao.listAll();
	}
	
/*	@Test
	public void testCreate() throws Exception {
		MenuVO menu = new MenuVO();
		
		menu.setMenuName("스테이크");
		menu.setMenuPrice(12000);
		menu.setMenuText("신메뉴등록");
		menu.setMenuDate("20220210");
		
		dao.create(menu);
	}*/
	
/*	@Test
	public void testUpdate() throws Exception {
		MenuVO menu = new MenuVO();
		menu.setMenuName("치킨샐러드");
		menu.setMenuPrice(2000);
		menu.setMenuText("최고의음식");
		menu.setMenuDate("20220211");
		menu.setMenuId("MENU030");
		dao.update(menu);
	}*/
	
/*	@Test
	public void testDelete() throws Exception {
		dao.delete("MENU008");
	}*/
	
	

}
