package com.celebback.head.frcheck.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.celebback.vo.CheckingVO;
import com.celebback.vo.ChkFailVO;
import com.celebback.vo.FrPaperVO;
import com.celebback.vo.PagingVO;
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
@Mapper
public interface frCheckDAO {

	/**
	 * 가맹점주 메인 페이지 - 점검내역 조회
	 * @param authName
	 * @return
	 */
	public List<CheckingVO> selectfrMainCheckList(String authName);
	
	/**
	 * 가맹점점검관리 조회
	 * @param pagingVO
	 * @return
	 */
	public List<CheckingVO> selectfrCheckList(PagingVO<CheckingVO> pagingVO);
	
	/**
	 * 가맹점검관리 페이징
	 * @param pagingVO
	 * @return
	 */
	public int selectTotalRecord(PagingVO<CheckingVO> pagingVO);
	
	/**
	 * 가맹점점검관리 캘린더
	 * @return
	 */
	public List<Map<String, Object>> selectCalendar();
	
	/**
	 * 점검 결과 등록
	 * @param checkingVO
	 * @return
	 */
	public int insertChecking(CheckingVO checkingVO);
	
	/**
	 * 점검 결과 등록 - 점검 미달 등록 ( eduSch, ChkFail)
	 * @param checkingVO
	 * @return
	 */
	public int insertEduSchChkFail(CheckingVO checkingVO);
	
	/**
	 * 얘는 확인 필요
	 * 점검 미달 가맹점 공문 발송 - 공문 등록
	 * @param checkingVO
	 * @return
	 */
	public int insertFrPaper(FrPaperVO frPaperVO); 
}
