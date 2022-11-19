package com.celebback.fr.analysis.popular.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import com.celebback.board.frNotice.dao.FrNoticeDAO;
import com.celebback.fr.analysis.popular.dao.PopularDao;
import com.celebback.vo.PopularVO;

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
@Service
public class PopularServiceImpl implements PopularService{
	
	@Inject 
	PopularDao dao;
	@Inject
	FrNoticeDAO frNoticeDao;
	
	public PopularVO getPopular(PopularVO vo,  Authentication authentication) {
		
		String ownerId = authentication.getName();
		String franId = (frNoticeDao.selectFranId(ownerId));
		vo.setFranId(franId);
		
		vo.setWishCnt(dao.getWishCnt(vo));
		vo.setWishCntMonth(dao.getWishCntMonth(vo));
		vo.setReviewCnt(dao.getReviewCnt(vo));
		vo.setReviewCntMonth(dao.getReviewCnt(vo));
		
		List<PopularVO> menulist = dao.getMenuCnt(vo);
		System.out.println(menulist);
		Map<String, Integer> tempMap = new HashMap<>();
		List<String> menuThumbList = new ArrayList<>();
		for(PopularVO menu : menulist) {
			tempMap.put(menu.getMenuName(),menu.getSumQty());
			menuThumbList.add(menu.getMenuName()+":"+menu.getSumQty()+":"+menu.getThumbImg());
		}
		vo.setMenuMap(tempMap); 
		vo.setMenuThumbList(menuThumbList);

		List<PopularVO> allPcntlist = dao.getAllPcntCnt(vo);
		List<String> temp2List = new ArrayList<>();
		for(PopularVO pcnt : allPcntlist) {
			temp2List.add(pcnt.getMorderDate()+":"+pcnt.getAllPcnt()); 
		}
		vo.setAllPcntList(temp2List);
		
		List<String> allDateList = new ArrayList<>();
		List<String> allCntList = new ArrayList<>();
		for(String item : temp2List) {
			allDateList.add(item.split(":")[0]);
			allCntList.add(item.split(":")[1]);
		}
		vo.setAllDateList(allDateList);
		vo.setAllCntList(allCntList);
		
		List<PopularVO> resvPcntlist = dao.getResvPcntCnt(vo);
		List<String> temp3List = new ArrayList<>();
		for(PopularVO pcnt : resvPcntlist) {
			temp3List.add(pcnt.getResvDate()+":"+pcnt.getResvPcnt());
		} 
		vo.setResvPcntList(temp3List);
		List<String> resvCntList = new ArrayList<>();
		for(String item : temp3List) {
			resvCntList.add(item.split(":")[1]);
		}
		vo.setResvCntList(resvCntList);
		return vo;
	}
	

}
