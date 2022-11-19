package com.celebback.fr.reserve.cotroller;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
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
@RequestMapping("/fr/reserve/resvReq")
public class ResvReqRetrieveController {
	@Inject
	ResvService resvService;
	
	@Inject
	FrOrderService frOrderService;
	
	@GetMapping
	public String resvReqList(
			Principal principal
			, Model model
	) {
		
		String authName = principal.getName();
		String franId = frOrderService.retrieveFranId(authName);
		
		List<ReserveVO> reqResvList = resvService.retrieveReqResvList(franId);
		
		model.addAttribute("reqResvList", reqResvList);
		return "fr/reserve/resvReqList";
	}
	
	// 예약요청 상세조회
	@PostMapping(value="/{resvId}", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String resvReqDetail(
			Principal principal
			, @PathVariable String resvId
			, Model model
	) {
		String authName = principal.getName();
		String franId = frOrderService.retrieveFranId(authName);
		
		ReserveVO resvVO = new ReserveVO();
		resvVO.setResvId(resvId);
		resvVO.setFranId(franId);
		List<ReserveVO> reqResvDetail = resvService.retrieveReqResv(resvVO);
		model.addAttribute("reqResvDetail", reqResvDetail);
		return "jsonView";
	}
	

}










