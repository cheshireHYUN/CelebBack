package com.celebback.member.mypage.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.celebback.member.mypage.service.MypageService;
import com.celebback.vo.MyCpnVO;
import com.celebback.vo.NotificationVO;
import com.celebback.vo.ReserveVO;

@Controller
@RequestMapping("/mypage/mycoupon")
public class MycouponRetrieveController {
	
	@Inject
	MypageService service;
	
	@GetMapping
	public String mycouponList() {
		return "member/mypage/mycouponList";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String proccessJsonData(
			Authentication authentication,
			Model model) {
		
		String memId = authentication.getName();
		
		List<MyCpnVO> mycouponList = service.retrieveMycouponList(memId);
		model.addAttribute("mycoupon", mycouponList);
		
		int totalNoti = service.totalNotifications(memId);
		NotificationVO notificationVO = new NotificationVO();
		notificationVO.setMemId(memId);
		notificationVO.setTotalNoti(totalNoti);
		
		service.createNotification(notificationVO);
		
		service.deleteNullRow(notificationVO.getMemId());
		
		List<NotificationVO> noti = service.retrieveNotificationList(notificationVO.getMemId());
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
