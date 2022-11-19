package com.celebback.head.paper.service;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

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
public interface PaperService {

	/**
	 * 공문 전체 조회
	 * @param pagingVO
	 * @return
	 */
	public List<PaperVO> retrievePaper(PagingVO<PaperVO> pagingVO);
	
	/**
	 * 공문 상세 조회
	 * @param paperId
	 * @return
	 */
	public PaperVO retrievePaper(String paperId);
	
	/**
	 * 공문 등록
	 * @param paperVO
	 * @param request 
	 * @throws IOException 
	 */
	public void insertPaper(PaperVO paperVO, MultipartHttpServletRequest request) throws IOException;
	
	/**
	 * 공문 수정
	 * @param paperVO
	 */
	public void modifyPaper(PaperVO paperVO);
	
	/**
	 * 공문 삭제
	 * @param paperId
	 */
	public void deletePaper(String paperId);
	
	/**
	 * 공문 발송
	 * @param paperVO
	 * @throws FileNotFoundException 
	 * @throws IOException 
	 */
	public void sendPaper(PaperVO paperVO) throws IOException;
}
