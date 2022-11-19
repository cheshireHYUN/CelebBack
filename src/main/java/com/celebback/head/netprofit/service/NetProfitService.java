package com.celebback.head.netprofit.service;

import java.util.List;
import java.util.Map;

import com.celebback.vo.NetProfitVO;

/**
 * 
 * @author 서재원
 * @since 2022. 8. 26.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 26.         서재원             최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
public interface NetProfitService {
	
	public NetProfitVO retrieveNetProfit(String month);
	
	public List<NetProfitVO> retrieveNetProfitChart(Map<String, String> map);

}
