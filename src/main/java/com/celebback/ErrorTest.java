package com.celebback;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

/**
 * 
 * @author 서재원
 * @since 2022. 8. 2.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 2.    서재원               최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Controller
public class ErrorTest {

	@GetMapping("/500") 
	public String index(Model model){
		int result = 1 / 0;
		model.addAttribute("serverTime", result);
		return "errorTest";
	}
	
	@PostMapping("/405") 
	public String index(){
		return "errorTest";
	}

}
