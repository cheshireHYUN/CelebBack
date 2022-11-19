package com.celebback.fr.info.seat.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.celebback.fr.info.seat.service.SeatService;
import com.celebback.vo.SitVO;

/**
 * 
 * @author 최서현
 * @since 2022. 8. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 5.       최서현      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Controller
@RequestMapping("/fr/info/seat")
public class SeatRetrieveController {
	
	@Inject
	SeatService service;
	
	@RequestMapping("/seatList")
	public String getSeatList() {
		return "fr/info/seat/seatList";
	}
	
	@ResponseBody
	@RequestMapping(value="/seatListNew", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<SitVO> newSeatList(Principal principal) {
		List<SitVO> seatList = new ArrayList<>();
		  try {
			  seatList = service.seatList(principal.getName());
		  } catch (Exception e) {
		    e.printStackTrace();
		  }
		  return seatList;
	}
	
	@RequestMapping(value="/seatPopUp/{t2}/{t4}/{t8}", method=RequestMethod.GET)
	public String seatPopUp(@PathVariable("t2") String t2, @PathVariable("t4") String t4, 
			@PathVariable("t8") String t8, Model model) {
		model.addAttribute("t2",t2);
		model.addAttribute("t4",t4);
		model.addAttribute("t8",t8)	;	
		return "popUp/seatPopUp.empty";
	}

}
