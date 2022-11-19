package com.celebback.head.frPayment.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.celebback.vo.FeePayVO;
import com.celebback.vo.FeeVO;
import com.celebback.vo.PagingVO;
import com.celebback.vo.PaperVO;
import com.celebback.vo.ProfitVO;
import com.celebback.vo.SimpleSearchCondition;

/**
 * 
 * @author 황단비
 * @since 2022. 9. 2.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 20.        황단비             최초작성
 * 2022. 9. 2.         서재원             대시보드 출력용 메소드 추가
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Mapper
public interface FrPaymentDAO {
	/**
	 * 가맹비 미납 가맹점 조회
	 * @param pagingVO
	 * @return
	 */
	public List<FeeVO> selectFrPaymentList(PagingVO<FeeVO> pagingVO);

	/**
	 * 가맹비 미납 목록 페이징
	 * @param pagingVO
	 * @return
	 */
	public int selectTotalRecord(PagingVO<FeeVO> pagingVO);
	
	/**
	 * 미납 내역 상세 조회
	 * @param franId
	 * @return
	 */
	public List<FeeVO> selectDetailFaymentList(String franId);
	
	/**
	 * 미납 공문 발송
	 * @param paperVO
	 * @return
	 */
	public int sendPaper(PaperVO paperVO);
	
	/**
	 * 가맹점 매출분석 페이지 - 조회
	 * @param profitVO
	 * @return
	 */
	public ProfitVO selectFrSales(ProfitVO profitVO); 
	
	/**
	 *  가맹점 매출분석 페이지 - 차트조회
	 * @param profitVO
	 * @return
	 */
	public Map<String, Object> selectChart(ProfitVO profitVO);
	
	/**
	 * 가맹점명 드롭다운
	 * @return
	 */
	public List<Map<String, Object>> selectFranName();
	
	/**
	 * 대시보드 출력용 (서재원)
	 * @return
	 */
	public List<FeeVO> selectFrPaymentListDashboard();
	
	/**
	 * 대시보드 갯수 출력용 (서재원)
	 * @return
	 */
	public int selectFrPaymentListCountDashboard();

	/**
	 * 가맹점주 매출분석 페이지 - 차트조회
	 * @param prof
	 * @return
	 */
	public Map<String, Object> selectOwnerChart(ProfitVO prof);
	
	/**
	 * 가맹점주 매출분석 페이지 - 조회
	 * @param profitVO
	 * @return
	 */
	public ProfitVO selectOwnerSales(ProfitVO profitVO); 
	
	/**
	 * 전체 음식 판매 순위
	 * @return
	 */
	public List<Map<String, Object>> selectWholeFLank();
	 
	/**
	 * 지역별 음식 판매 순위
	 * @return
	 */
	public List<Map<String, Object>> selectLocaFLank();
	
	/**
	 * 시즌별 음식 판매 순위 
	 * @return
	 */
	public List<Map<String, Object>> selectSeasonFLank1();
	
	/**
	 * 시즌별 음식 판매 순위 
	 * @return
	 */
	public List<Map<String, Object>> selectSeasonFLank2();
	
	/**
	 * 시즌별 음식 판매 순위 
	 * @return
	 */
	public List<Map<String, Object>> selectSeasonFLank3();
	
	/**
	 * 시즌별 음식 판매 순위 
	 * @return
	 */
	public List<Map<String, Object>> selectSeasonFLank4();
	
	/**
	 * 월 트렌드
	 * @return
	 */
	public List<Map<String, Object>> selectMonthFLank();
}
