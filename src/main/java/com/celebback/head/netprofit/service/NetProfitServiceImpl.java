package com.celebback.head.netprofit.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.celebback.head.netprofit.dao.NetProfitDAO;
import com.celebback.vo.NetProfitVO;

import lombok.extern.slf4j.Slf4j;

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

@Service
public class NetProfitServiceImpl implements NetProfitService{
	
	@Inject
	NetProfitDAO netProfitDAO;

	@Override
	public NetProfitVO retrieveNetProfit(String month) {
		NetProfitVO netProfit = netProfitDAO.selectNetProfit(month);
		return netProfit;
	}

	@Override
	public List<NetProfitVO> retrieveNetProfitChart(Map<String, String> map) {
		List<NetProfitVO> netProfitChart = netProfitDAO.selectNetProfitChart(map);
		return netProfitChart;
	}

}