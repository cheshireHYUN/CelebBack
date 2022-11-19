package com.celebback.fr.atOrder.controller;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.celebback.fr.atOrder.dao.AtOrderDAO;
import com.celebback.fr.atOrder.service.AtOrderService;
import com.celebback.vo.AtOrderVO;

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
@RequestMapping("/fr/atOrder")
public class AtOrderRetrieveController {
	@Inject
	AtOrderService service;
	
	@GetMapping
	public String atOrderListRetrieve(
			Principal principal
			,Model model
	) {
		String authName = principal.getName();
		List<AtOrderVO> atOrderList = service.retrieveAtOrderList(authName);
		
		model.addAttribute("atOrderList", atOrderList);
		return "fr/atOrder/atOrderList";
	}
	
	

}
