package com.celebback.board.notice.service;

import java.util.List;

import com.celebback.vo.AttatchVO;
import com.celebback.vo.NoticeVO;
import com.celebback.vo.PagingVO;

/**
 * @author 정아영
 * @since 2022. 8. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                    수정자              수정내용
 * --------       --------    ----------------------
 * 2022. 8. 5.     정아영              최초작성
 * 2022. 8. 9.     정아영              메소드 추가
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
public interface NoticeService {
	
	/**
	 * 게시글 목록 조회
	 * @param pagingVO
	 * @return
	 */
	public List<NoticeVO> retrieveNoticeListForMember(PagingVO<NoticeVO> pagingVO);
	
	/**
	 * 게시글 상세 조회
	 * @param postNo
	 * @return
	 */
	public NoticeVO retrieveNoticeForMember(String postNo);
	
	/**
	 * 게시글 목록 조회
	 * @param pagingVO
	 * @return
	 */
	public List<NoticeVO> retrieveNoticeList(PagingVO<NoticeVO> pagingVO);
	
	/**
	 * 게시글 상세 조회
	 * @param postNo
	 * @return
	 */
	public NoticeVO retrieveNotice(String postNo);
	
	/**
	 * 게시글 작성
	 * @param notice
	 */
	public void createNotice(NoticeVO notice);
	
	/**
	 * 게시글 수정
	 * @param notice
	 */
	public void updateNotice(NoticeVO notice);
	
	/**
	 * 게시글 삭제
	 */
	public void deleteNotice(NoticeVO notice);
	
	public AttatchVO downloadAttatch(int attatchNo);
}
