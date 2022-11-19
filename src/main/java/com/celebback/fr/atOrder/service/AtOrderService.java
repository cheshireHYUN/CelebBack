package com.celebback.fr.atOrder.service;
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

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.celebback.fr.atOrder.dao.AtOrderDAO;
import com.celebback.vo.AtOrderVO;

import lombok.extern.slf4j.Slf4j;

public interface AtOrderService {
	
	// 자동발주내역 조회
	public List<AtOrderVO> retrieveAtOrderList(String authName);
	
	// 자동발주 수정
	public void modifyAtOrder(HashMap<String, String> atOrderMap);
	
	//fran_id 구하기
	public String retrieveFranId(String authName);
}
