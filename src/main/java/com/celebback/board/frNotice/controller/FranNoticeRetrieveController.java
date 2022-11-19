package com.celebback.board.frNotice.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.celebback.board.frNotice.service.FrNoticeService;
import com.celebback.member.mypage.service.MypageService;
import com.celebback.vo.FrNoticeVO;
import com.celebback.vo.NotificationVO;
import com.celebback.vo.PagingVO;
import com.celebback.vo.ReserveVO;
import com.celebback.vo.SimpleSearchCondition;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/frNotice/{franId}")
public class FranNoticeRetrieveController {
	
	@Inject
	FrNoticeService service;
	
	@Inject
	MypageService mypageService;

	@GetMapping
	public String frNoticeList() {
		return "member/board/frNoticeList";
	}
	
	@GetMapping("{frannoticeNo}")
	public String frNoticeDetail(
			@PathVariable("frannoticeNo") int frannoticeNo
			, Authentication authentication
			, Model model
	) {
		FrNoticeVO frNotice = service.retrieveFrNoticeForHead(frannoticeNo);
		
		if(authentication!=null) {
			NotificationVO notificationVO = new NotificationVO();
			String memId = authentication.getName();
			Integer frNoticeNo = frNotice.getFrannoticeNo();
			notificationVO.setMemId(memId);
			notificationVO.setFrannoticeNo(frNoticeNo);
			log.info("********************** {}", notificationVO);
			mypageService.updateNotification(notificationVO);
		}
		
		model.addAttribute("frNotice", frNotice);
		
		return "member/board/frNoticeDetail";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String proccessJsonData(
			@PathVariable("franId") String franId,
			Authentication authentication,
			Model model
			,@RequestParam(value="searchType",required=false) String searchType
			,@RequestParam(value="searchWord",required=false)String searchWord
			,@RequestParam(value="page",required=false, defaultValue="1") int currentPage
			) {

		SimpleSearchCondition searchVO = new SimpleSearchCondition(searchType, searchWord);

		PagingVO<FrNoticeVO> pagingVO = new PagingVO<FrNoticeVO>(10,5);
		
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(searchVO);
		
		String franName = service.retrieveFranName(franId);
		
		pagingVO.setFranId(franId);
		pagingVO.setFranName(franName);
		
		service.retrieveFrNoticeListForMember(pagingVO);
		
		model.addAttribute("frNotice", pagingVO);
		
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
		
		ReserveVO remainDateVO = mypageService.retrieveReserveRemainDate(memId);
		model.addAttribute("remain", remainDateVO);

		
		return  "jsonView";
	}
}
