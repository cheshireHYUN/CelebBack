package com.celebback.head.prodinfo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * @author 서재원
 * @since 2022. 8. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 5.     서재원             최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Controller
@RequestMapping("/head/prodInfo")
public class ProdinfoCreateController {
	
	@GetMapping("form")
	public String prodInfoForm() {
		return "head/prodInfo/prodInfoForm";
	}
	
	// PostMapping (데이터 받아와서 글 작성)
}
