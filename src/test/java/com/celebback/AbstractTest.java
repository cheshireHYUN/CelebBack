package com.celebback;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringRunner.class)
@ContextHierarchy({
	@ContextConfiguration("file:src/main/resources/com/celebback/spring/*-context.xml")
	, @ContextConfiguration("file:webapp/WEB-INF/spring/appServlet/servlet-context.xml")
})
@WebAppConfiguration("file:webapp")
@Transactional
public abstract class AbstractTest {

}
