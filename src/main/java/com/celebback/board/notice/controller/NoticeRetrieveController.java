package com.celebback.board.notice.controller;

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

import com.celebback.board.notice.service.NoticeService;
import com.celebback.member.mypage.service.MypageService;
import com.celebback.vo.NoticeVO;
import com.celebback.vo.NotificationVO;
import com.celebback.vo.PagingVO;
import com.celebback.vo.ReserveVO;
import com.celebback.vo.SimpleSearchCondition;

//import com.celebback.board.notice.service.NoticeService;

/**
 * @author 정아영
 * @since 2022. 8. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                    수정자              수정내용
 * --------       --------    ----------------------
 * 2022. 8. 5.     정아영              최초작성
 * 2022. 8. 9.     정아영              uri 연결
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/Notice")
public class NoticeRetrieveController {
	
	@Inject
	NoticeService service;
	
	@Inject
	MypageService mypageService;

	@GetMapping
	public String NoticeList() {
		return "member/board/noticeList";
	}
	
	@GetMapping("{postNo}")
	public String NoticeDetail(
			@PathVariable("postNo") String postNo
			, Model model
	) {
		NoticeVO notice = service.retrieveNoticeForMember(postNo);
		model.addAttribute("notice", notice);
		return "member/board/noticeDetail";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String proccessJsonData(
			Authentication authentication,
			Model model
			,@RequestParam(value="searchType",required=false) String searchType
			,@RequestParam(value="searchWord",required=false)String searchWord
			,@RequestParam(value="page",required=false, defaultValue="1") int currentPage
			) {

		SimpleSearchCondition searchVO = new SimpleSearchCondition(searchType, searchWord);

		PagingVO<NoticeVO> pagingVO = new PagingVO<NoticeVO>(10,5);
		
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(searchVO);
		
		service.retrieveNoticeListForMember(pagingVO);
		
		model.addAttribute("notice", pagingVO);
		
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
