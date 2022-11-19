package com.celebback.fr.atOrder.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.celebback.fr.atOrder.dao.AtOrderDAO;
import com.celebback.vo.AtOrderVO;

/**
 * 
 * @author 이혜원
 * @since 2022. 8. 9.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 9.       이혜원      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Service
public class AtOrderServiceImpl implements AtOrderService {
	@Inject
	AtOrderDAO atOrderDAO;
	
	
	@Override
	public List<AtOrderVO> retrieveAtOrderList(String authName) {
		return atOrderDAO.selectAtOrderList(authName);
	}

	@Override
	public void modifyAtOrder(HashMap<String, String> atOrderMap) {
		atOrderDAO.updateAtOrder(atOrderMap);
		System.out.println(atOrderMap);
		
	}

	@Override
	public String retrieveFranId(String authName) {
		String franId = atOrderDAO.selectFranId(authName);
		return franId;
	}


	
	
	

}
