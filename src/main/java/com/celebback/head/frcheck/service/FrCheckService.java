package com.celebback.head.frcheck.service;
/**
 * 
 * @author 황단비
 * @since 2022. 8. 26.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자            수정내용
 * --------     --------    ----------------------
 * 2022. 8. 26.       황단비      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

import java.util.List;

import com.celebback.vo.CheckingVO;
import com.celebback.vo.PagingVO;

public interface FrCheckService {

	/**
	 * 가맹점점검관리 조회
	 * @param pagingVO
	 * @return
	 */
	public List<CheckingVO> retrieveFrCheckList(PagingVO<CheckingVO> pagingVO);

	/**
	 * 점검 결과 등록
	 * @param checkingVO
	 */
	void createFrCheck(CheckingVO checkingVO);

	/**
	 * 점검 미달 가맹점 공문 발송
	 * @param checkingVO
	 */
	public void createFrCheckPaper(CheckingVO checkingVO);
}
