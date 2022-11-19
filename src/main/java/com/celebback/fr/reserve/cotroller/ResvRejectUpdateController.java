package com.celebback.fr.reserve.cotroller;

import java.security.Principal;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.celebback.fr.frOrder.service.FrOrderService;
import com.celebback.fr.reserve.service.ResvService;
import com.celebback.vo.ReserveVO;
import com.celebback.vo.TradeVO;

/**
 * 
 * @author 이혜원
 * @since 2022. 8. 29.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 29.       이혜원      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Controller
@RequestMapping("/fr/reserve/rejectResv")
public class ResvRejectUpdateController {

	@Inject
	ResvService resvService;
	
	@Inject
	FrOrderService frOrderService;
	
	// 예약요청 거절
	@PutMapping("/reject")
	public String rejectResvUpdate(
			ReserveVO resvVO
			,@RequestParam(value="resvId", required=false) String resvId
			,@RequestParam(value="resvNote",required=false) String resvNote
			,Principal principal
	) {
		System.out.println("ff"+resvId);
		String authName = principal.getName();
		String franId = frOrderService.retrieveFranId(authName);
		
		resvVO.setResvId(resvId);
		resvVO.setFranId(franId);
		
		resvService.modifyRejectResv(resvVO);
		return "redirect:/fr/reserve/resvReq";
	}
	
}
