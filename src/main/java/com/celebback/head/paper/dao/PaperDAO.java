package com.celebback.head.paper.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.celebback.vo.AttatchVO;
import com.celebback.vo.FranVO;
import com.celebback.vo.PagingVO;
import com.celebback.vo.PaperVO;
/**
 * 
 * @author 황단비
 * @since 2022. 8. 16.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자            수정내용
 * --------     --------    ----------------------
 * 2022. 8. 16.       황단비      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface PaperDAO {
	/**
	 * 공문 전체 조회
	 * @return
	 */
	public List<PaperVO> selectPaperList(PagingVO<PaperVO> pagingVO);
	
	/**
	 * 공문 페이징
	 * @param pagingVO
	 * @return
	 */
	public int selectTotalRecord(PagingVO<PaperVO> pagingVO);
	
	/**
	 * 공문 상세조회
	 * @param paperId
	 * @return
	 */
	public PaperVO selectPaper(String paperId);
	
	/**
	 * 공문 수정
	 * @param paperVO
	 * @return
	 */
	public int updatePaper(PaperVO paperVO);
	
	/**
	 * 공문 등록
	 * @param paperVO
	 * @return
	 */
	public int insertPaper(PaperVO paperVO);
	
	/**
	 * 공문 파일 등록
	 * @param paperVO
	 * @return
	 */
	public int insertAttatch(PaperVO paperVO);
	
	/**
	 * 공문 삭제
	 * @param paperId
	 * @return
	 */
	public int deletePaper(String paperId);
	
	/**
	 * 공문 삭제 - child record 삭제
	 * @param paperId
	 * @return
	 */
	public int delBeforePaper(String paperId);

	/**
	 * 공문 발송
	 * @param paperVO
	 * @return
	 */
	public int sendPaper(PaperVO paperVO);
	
	/**
	 * 가맹점주 메인 페이지 - 공문 리스트 조회
	 * @param authName
	 * @return
	 */
	public List<PaperVO> selectPaperListMain(String authName); 
	
	/**
	 * 가맹점주 ID 단순 조회
	 * @return
	 */
	public List<Map<String, Object>> selectOwnerId();
	
}
