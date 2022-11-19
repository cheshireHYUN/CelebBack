package com.celebback.head.prodstock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * @author 서재원
 * @since 2022. 8. 6.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 6.   서재원                    최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Controller
@RequestMapping("/head/prodStock")
public class ProdStockController {
	
	@GetMapping
	public String prodStockList() {
		return "head/prodStock/prodStockList";
	}
	
	// PutMapping (데이터 받아와서 글 수정, 자바스크립트에서 더블클릭 구현)
}
