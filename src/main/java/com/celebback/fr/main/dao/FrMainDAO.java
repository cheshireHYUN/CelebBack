package com.celebback.fr.main.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
/**
 * 
 * @author 황단비
 * @since 2022. 8. 19.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자            수정내용
 * --------     --------    ----------------------
 * 2022. 8. 19.       황단비      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

import com.celebback.vo.CheckingVO;
import com.celebback.vo.EduSchVO;
import com.celebback.vo.FrPaperVO;
import com.celebback.vo.PaperVO;
import com.celebback.vo.ResvVO;
import com.celebback.vo.TradeVO;
@Mapper
public interface FrMainDAO {

	/**
	 * 교육 알림 조회
	 * @param authNAme
	 * @return
	 */
	public List<EduSchVO> selectEduList(String authNAme);
	
	/**
	 * 금일 트레이딩 내역 조회
	 * @param authName
	 * @return
	 */
	public List<TradeVO> selectTodayTradeList(String authName);
	
	/**
	 * 금주 예약 현황 조회
	 * @param authName
	 * @return
	 */
	public List<ResvVO> selectDayResvList(String authName);
	
	public String selectFranName(String ownerId);
}
