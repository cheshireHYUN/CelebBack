package com.celebback.fr.info.seat.service;

import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.celebback.board.frNotice.dao.FrNoticeDAO;
import com.celebback.fr.info.seat.dao.SeatDao;
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

@Service
public class SeatServiceImpl implements SeatService{
	
	@Inject
	SeatDao dao;
	@Inject
	FrNoticeDAO frNoticeDao;

	@Override
	@Transactional
	public void createSeat(String data, Authentication authentication) {
		String ownerId = authentication.getName();
		String franId = (frNoticeDao.selectFranId(ownerId));
		SitVO vo = new SitVO();
		vo.setFranId(franId);
		dao.sitDelete(vo);
		
		JSONParser jsonParser = new JSONParser();
		JSONArray insertParam = null;
		try {
			insertParam = (JSONArray) jsonParser.parse(data);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		for(int i=0; i<insertParam.size(); i++){
			//배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출            
			JSONObject seatData = (JSONObject) insertParam.get(i);
			vo.setSitId((String)seatData.get("sitId"));
			vo.setDirec((String)seatData.get("direc"));
			String strX = (seatData.get("sitX")).toString();
			double x = Double.valueOf(strX).doubleValue();
			String strY = (seatData.get("sitY")).toString();
			double y = Double.valueOf(strY).doubleValue();

			vo.setSitX(y);
			vo.setSitY(x);

			try {
				dao.sitInsert(vo);	
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}


	@Override
	public List<SitVO> seatList(String ownerId) {
		String franId = frNoticeDao.selectFranId(ownerId);
		return dao.sitList(franId);
	}
	@Override
	public List<SitVO> seatList2(String franId) {
		return dao.sitList(franId);
	}



}
