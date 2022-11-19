package com.celebback;

import java.sql.Connection;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


//@RunWith(SpringJUnit4ClassRunner.class)
//xml설정을 이용하는 경우
//@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//JAVA설정을 사용하는 경우 @ContextConfiguration(classes= {RootConfig.class})

@RunWith(SpringRunner.class)
@ContextHierarchy({
	@ContextConfiguration("file:src/main/resources/com/celebback/spring/*-context.xml")
	, @ContextConfiguration("file:webapp/WEB-INF/spring/appServlet/servlet-context.xml")
})
@WebAppConfiguration("file:webapp")
public class DataSourceTest {
	
	@Inject
	private DataSource ds;
	
	@Test
	public void testConection()throws Exception{
		try(Connection con = ds.getConnection()) {
			System.out.println(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}