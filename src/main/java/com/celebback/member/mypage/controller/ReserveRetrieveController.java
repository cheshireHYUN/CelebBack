package com.celebback.member.mypage.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.celebback.member.mypage.service.MypageService;
import com.celebback.vo.NotificationVO;
import com.celebback.vo.ReserveVO;

@Controller
@RequestMapping("/mypage/reserve")
public class ReserveRetrieveController {
	
	@Inject
	MypageService service;
	
	@Inject
	MypageService mypageService;
	
	@GetMapping
	public String reserveList() {
		return "member/mypage/reserveList";
	}
	
	@GetMapping("{resvId}")
	public String reserveDetail(
			@PathVariable("resvId") String resvId
			, Model model
	) {
		ReserveVO resv = service.retrieveReserve(resvId);
		model.addAttribute("resv", resv);
		return "member/mypage/reserveDetail";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String proccessJsonData(
			Authentication authentication,
			Model model) {
		
		String memId = authentication.getName();
		
		List<ReserveVO> resvs = service.retrieveReserveList(memId);
		model.addAttribute("resvs", resvs);
		
		int totalNoti = mypageService.totalNotifications(memId);
		NotificationVO notificationVO = new NotificationVO();
		notificationVO.setMemId(memId);
		notificationVO.setTotalNoti(totalNoti);
		
		mypageService.createNotification(notificationVO);
		
		mypageService.deleteNullRow(notificationVO.getMemId());
		
		List<NotificationVO> noti = mypageService.retrieveNotificationList(notificationVO.getMemId());
		for (NotificationVO notiVO : noti) {
			notiVO.setMemId(memId);
			notiVO.setTotalNoti(totalNoti);
		}
		model.addAttribute("noti", noti);
		
		ReserveVO remainDateVO = service.retrieveReserveRemainDate(memId);
		model.addAttribute("remain", remainDateVO);

		return "jsonView";
	}
	
	@GetMapping(value="{resvId}", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String proccessJsonData2(
			Authentication authentication,
			@PathVariable("resvId") String resvId,
			Model model) {
		
		List<ReserveVO> menuList = service.retrieveReserveMenuList(resvId);
		model.addAttribute("menu", menuList);
		
		int bill = service.retrieveBill(resvId);
		model.addAttribute("bill", bill);
		
		String memId = authentication.getName();
		
		int totalNoti = mypageService.totalNotifications(memId);
		NotificationVO notificationVO = new NotificationVO();
		notificationVO.setMemId(memId);
		notificationVO.setTotalNoti(totalNoti);
		
		mypageService.createNotification(notificationVO);
		
		mypageService.deleteNullRow(notificationVO.getMemId());
		
		List<NotificationVO> noti = mypageService.retrieveNotificationList(notificationVO.getMemId());
		for (NotificationVO notiVO : noti) {
			notiVO.setMemId(memId);
			notiVO.setTotalNoti(totalNoti);
		}
		model.addAttribute("noti", noti);
		
		ReserveVO remainDateVO = service.retrieveReserveRemainDate(memId);
		model.addAttribute("remain", remainDateVO);
		
		return "jsonView";
	}
}
