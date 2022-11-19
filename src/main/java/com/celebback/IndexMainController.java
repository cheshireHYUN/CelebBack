package com.celebback;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.celebback.member.mypage.service.MypageService;
import com.celebback.vo.NotificationVO;
import com.celebback.vo.ReserveVO;
/**
 * 
 * @author 황단비
 * @since 2022. 8. 4.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자            수정내용
 * --------     --------    ----------------------
 * 2022. 8. 4.       황단비      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/") 
public class IndexMainController {
	
	@Inject
	MypageService service;
	
	@GetMapping
	public String index(
			Authentication authentication
	){
		service.updateStampToResv();

		if(authentication!=null) {
			String memId = authentication.getName();
			service.updateStampToMem(memId);
			service.createStampCoupon(memId);
			service.createReviewCoupon(memId);
		}
		
		return "index";
	}
	
	@GetMapping(value= {
						"/", "/mypage", "/mypage/account", "/mypage/wish", "/reserve/info/{franId}", "/reserve/menu/{franId}", "/reserve/confirm",
						"/review/{franId}", "frNotice/{franId}/{frannoticeNo}", "/Notice/{postNo}"
						}, produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String proccessJsonData2(
			Authentication authentication,
			Model model) {
		
		String memId = authentication.getName();
		
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
