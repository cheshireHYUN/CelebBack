package com.celebback.fr.offsales.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * @author 최서현
 * @since 2022. 8. 6.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 6.       최서현      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Controller
@RequestMapping("/fr/offSales")
public class OffSalesUpdateController {
	
	@RequestMapping("/edit")
	public String offSalesEdit() {
		return "fr/offSales/offSalesEdit";
	}

}
