package com.celebback;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 
 * @author 황단비
 * @since 2022. 8. 4.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자            수정내용
 * --------     --------    ----------------------
 * 2022. 8. 4.       황단비      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Controller
public class HeadMainController {
	
	@RequestMapping("/head")
	public String headIndex(){
		return "head";
	}
}
