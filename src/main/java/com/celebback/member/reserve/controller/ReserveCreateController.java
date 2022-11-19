package com.celebback.member.reserve.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.celebback.fr.info.menu.service.FrMenuService;
import com.celebback.fr.info.seat.service.SeatService;
import com.celebback.member.reserve.service.ReserveService;
import com.celebback.vo.FranVO;
import com.celebback.vo.MenuVO;
import com.celebback.vo.MyCpnVO;
import com.celebback.vo.ResvInfoVO;
import com.celebback.vo.SitVO;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

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
@RequestMapping("/reserve")
public class ReserveCreateController {
	
	@Inject
	ReserveService service;
	@Inject
	SeatService service2;
	@Inject
	FrMenuService service3;
	
	@RequestMapping("/info/{franId}")
	public String createReserveDate(@PathVariable("franId") String franId, Model model) {
		// 오픈&종료, 브레이크타임시간
		FranVO franTime = service.franTimeInfo(franId);
		// 좌석배치도
		List<SitVO> seatList = service2.seatList2(franId);
		
		model.addAttribute("franTime",franTime);
		model.addAttribute("seatList",seatList);
		model.addAttribute("franId",franId);
		
		return "member/reserve/reserveForm";
	}
	
	@ResponseBody
	@PostMapping("/info/resvSeatInfo")
	public List<String> getResvSitId(@RequestBody ResvInfoVO vo) {
		List<String> resvSitList = new ArrayList<String>();
		try {
			resvSitList = service.reserveSitList(vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resvSitList;
	}

	@PostMapping("/menu/{franId}")
	public String createReserveMenu(@PathVariable("franId") String franId, ResvInfoVO vo, Model model, Authentication authentication ) {
		
		// 메뉴정보
		List<MenuVO> frMenuList = service3.frMenuListMember(franId);
		List<MenuVO> appetizerList = new ArrayList<>();
		List<MenuVO> mainList = new ArrayList<>();
		List<MenuVO> dessertList = new ArrayList<>();
		
		for(MenuVO menu : frMenuList) {
			switch(menu.getMenuType()) {
			case "Appetizer" :
				appetizerList.add(menu);
				break;
			case "Main" :
				mainList.add(menu);
				break;
			case "Dessert" :
				dessertList.add(menu);
				break;
			}
		}
		
		// 쿠폰정보 - 보유한 쿠폰중 사용되지 않은 쿠폰만 불러온다
		String memId = authentication.getName();
		List<MyCpnVO> cpnList = service.myUnusedCpn(memId);
		model.addAttribute("cpnList",cpnList);
		
		// 가맹점정보, 예약자 정보
		model.addAttribute("franId", franId);
		model.addAttribute("memId", memId);
		
		// 메뉴정보(종류별로)
		model.addAttribute("appetizerList",appetizerList);
		model.addAttribute("mainList",mainList);
		model.addAttribute("dessertList",dessertList); 
		
		// 이전페이지에서 선택한 정보, 즉 날짜/인원수/좌석번호
		model.addAttribute("resvInfo",vo);
		
		return "member/reserve/reserveForm2";
	}
	
	private IamportClient api;
	
	public ReserveCreateController() {
		this.api = new IamportClient("5396366384017153","483b3abedb0f4e219f1fe9528a7fe23131a03914c61ecc767f0886e618f94e907da270c735dbd609");
	}
			
	@ResponseBody
	@RequestMapping(value="/verifyIamport/{imp_uid}", method=RequestMethod.POST)
	public IamportResponse<Payment> paymentByImpUid(
			Model model
			, Locale locale
			, HttpSession session
			, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException
	{	
			return api.paymentByImpUid(imp_uid);
	}
	
	
	// 예약저장 -> 제출버튼 누르면 [현장결제] 기준으로 ajax로 insert해주는 컨트롤러 만들어서 호출해주고, success하면 이 페이지로 오면 될듯!! 
	@ResponseBody
	@PostMapping("/saveReserve")
	public ResponseEntity<String> saveReserve(@RequestBody ResvInfoVO vo) {
		
		ResponseEntity<String> entity = null;
		try {
			service.resvAndMorderSave(vo);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}
	
	// 예약완료 폐이지
	@RequestMapping("/confirm")
	public String confirmReserve() {
		return "member/reserve/reserveConfirm";
	}
	
}
