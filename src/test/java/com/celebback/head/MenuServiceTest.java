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
import com.celebback.head.menu.service.MenuService;
import com.celebback.vo.MenuVO;

@RunWith(SpringRunner.class)
@ContextHierarchy({
	@ContextConfiguration("file:src/main/resources/com/celebback/spring/*-context.xml")
	, @ContextConfiguration("file:webapp/WEB-INF/spring/appServlet/servlet-context.xml")
})
@WebAppConfiguration("file:webapp")
public class MenuServiceTest {
	
	private static Logger logger = LoggerFactory.getLogger(MenuDaoTest.class);
	
	@Inject
	private MenuDao dao;
	@Inject
	private MenuService service;
	
/*	@Test
	public void testCreateService() throws Exception {
		MenuVO menu = new MenuVO();
		menu.setMenuDate("20221020");
		menu.setMenuName("새우버거");
		menu.setMenuPrice(20);
		menu.setMenuText("존맛");
		
		service.createMenu(menu);
	}*/
	
	@Test
	public void listAll() throws Exception {
		dao.listAll();
	}

}
