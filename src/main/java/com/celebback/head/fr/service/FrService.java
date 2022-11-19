package com.celebback.head.fr.service;
/**
 * 
 * @author 황단비
 * @since 2022. 8. 4.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자            수정내용
 * --------     --------    ----------------------
 * 2022. 8. 4.       황단비      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.celebback.vo.FranVO;
import com.celebback.vo.PagingVO;

public interface FrService {
	/**
	 *  가맹점 전체 조회
	 * @param pagingVO
	 * @return
	 */
	public List<FranVO> retrieveFranList(PagingVO<FranVO> pagingVO);
	
	/**
	 * 가맹점 상세 조회
	 * @param franId
	 * @return
	 */
	public FranVO retrieveFran(String franId);

	/**
	 * 엑셀 파일로 가맹점 정보 수정
	 * @param request
	 * @throws IOException 
	 */
	public void excelUpload(MultipartHttpServletRequest request) throws IOException;

	/**
	 * 가맹점 정보 엑셀 다운로드
	 * @param res
	 */
	public void excelDownload(HttpServletResponse res);
}
