package com.celebback.fr.trade.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * @author 이혜원
 * @since 2022. 8. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 5.       이혜원      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Controller
@RequestMapping("/fr/tradeResp")
public class TradeRespRetrieveController {
	
	@GetMapping
	public String tradeRespList() {
		return "fr/trade/tradeRespList";
	}

}
