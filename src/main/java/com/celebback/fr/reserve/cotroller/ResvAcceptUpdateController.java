package com.celebback.fr.reserve.cotroller;

import java.security.Principal;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.celebback.fr.frOrder.service.FrOrderService;
import com.celebback.fr.reserve.service.ResvService;
import com.celebback.vo.ReserveVO;

/**
 * 
 * @author 이혜원
 * @since 2022. 8. 8.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 8.       이혜원      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Controller
@RequestMapping("/fr/reserve/acceptResv")
public class ResvAcceptUpdateController {
	
	@Inject
	ResvService resvService;
	
	@Inject
	FrOrderService frOrderService;
	
	// 예약요청 수락
	@PostMapping(value="/{resvId}", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String acceptResvUpdate(
			Principal principal
			, @PathVariable String resvId
			, Model model
	) {
		String authName = principal.getName();
		String franId = frOrderService.retrieveFranId(authName);
		
		ReserveVO resvVO = new ReserveVO();
		resvVO.setResvId(resvId);
		resvVO.setFranId(franId);
		
		resvService.modifyAcceptResv(resvVO);
		return "jsonView";
	}
	
////	성공시 페이지 이동 메서드
//	@GetMapping(value="/success")
//	public String successDelete() {
//		return "fr/reserve/resvReqList";
//	}
	

}
