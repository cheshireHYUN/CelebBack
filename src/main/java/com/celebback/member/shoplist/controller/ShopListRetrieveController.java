package com.celebback.member.shoplist.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.celebback.fr.info.menu.service.FrMenuService;
import com.celebback.member.mypage.service.MypageService;
import com.celebback.member.shoplist.service.ShopListService;
import com.celebback.member.shoplist.service.ShopService;
import com.celebback.vo.FrPageVO;
import com.celebback.vo.FranVO;
import com.celebback.vo.MenuVO;
import com.celebback.vo.NotificationVO;
import com.celebback.vo.ReserveVO;
import com.celebback.vo.WishVO;

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
@RequestMapping("/shop")
public class ShopListRetrieveController {
	
	@Inject
	ShopListService service;
	@Inject
	FrMenuService service2;
	
	@Inject
	ShopService shopService;
	
	@Inject
	MypageService mypageService;
	
	// 매장조회
	@RequestMapping("/list")
	public String shopList(Model model, FrPageVO vo) {
		return "member/shop/shopList";
	}
	// 매장조회 + 페이징
	@ResponseBody
	@PostMapping("/list")
	public List<FranVO> shopList(@RequestBody FrPageVO vo) {
		List<FranVO> shopList = service.shopList(vo);
		
		for (FranVO franVO : shopList) {
			String franId = franVO.getFranId();
			int starAvg = shopService.retrieveFranStarAvg(franId);
			franVO.setStarAvg(starAvg);
			String star = "";
			switch (starAvg) {
			case 0:
				star = "<i class='icon_star'></i><i class='icon_star'></i><i class='icon_star'></i><i class='icon_star'></i><i class='icon_star'></i>";
				break;
			case 1:
				star = "<i class='icon_star voted'></i><i class='icon_star'></i><i class='icon_star'></i><i class='icon_star'></i><i class='icon_star'></i>";
				break;
			case 2:
				star = "<i class='icon_star voted'></i><i class='icon_star voted'></i><i class='icon_star'></i><i class='icon_star'></i><i class='icon_star'></i>";
				break;
			case 3:
				star = "<i class='icon_star voted'></i><i class='icon_star voted'></i><i class='icon_star voted'></i><i class='icon_star'></i><i class='icon_star'></i>";
				break;
			case 4:
				star = "<i class='icon_star voted'></i><i class='icon_star voted'></i><i class='icon_star voted'></i><i class='icon_star voted'></i><i class='icon_star'></i>";
				break;
			case 5:
				star = "<i class='icon_star voted'></i><i class='icon_star voted'></i><i class='icon_star voted'></i><i class='icon_star voted'></i><i class='icon_star voted'></i>";
				break;
			}
			franVO.setStar(star);
			
		}
		
		return shopList;
	}
	// 페이징바
	@ResponseBody
	@GetMapping("/listbar")
	public String shopListBar() {
		String totalNum = Integer.toString(service.totalPage());
		return totalNum;
	}
	
	// 매장의 상세페이지 조회
	@RequestMapping("/detail/{franId}")
	public String shopDetail(@PathVariable("franId") String franId, Model model) {
		List<MenuVO> frMenuList = service2.frMenuListMember(franId);
		
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
		
		model.addAttribute("franId", franId);
		model.addAttribute("appetizerList",appetizerList);
		model.addAttribute("mainList",mainList);
		model.addAttribute("dessertList",dessertList);
		
		return "member/shop/shopDetail";
	}
	
	@GetMapping(value="/list",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String proccessJsonData(
			Authentication authentication,
			Model model) {
		if(authentication!=null) {
			String memId = authentication.getName();
			List<WishVO> wishList = mypageService.retrieveFranWishList(memId);
			model.addAttribute("wishList", wishList);
		}
		
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
		
		return "jsonView";
	}
}
