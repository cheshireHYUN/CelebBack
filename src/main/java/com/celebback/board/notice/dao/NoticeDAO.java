package com.celebback.board.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.celebback.vo.NoticeVO;
import com.celebback.vo.PagingVO;

/**
 * @author 정아영
 * @since 2022. 8. 10.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                    수정자              수정내용
 * --------       --------    ----------------------
 * 2022. 8. 9.     정아영              최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface NoticeDAO {
	public int insertNotice(NoticeVO notice);
	
	public int selectTotalRecordForMember(PagingVO<NoticeVO> pagingVO);
	
	public List<NoticeVO> selectNoticeListForMember(PagingVO<NoticeVO> pagingVO);
	
	public NoticeVO selectNoticeForMember(String postNo);
	
	public int selectTotalRecord(PagingVO<NoticeVO> pagingVO);
	
	public List<NoticeVO> selectNoticeList(PagingVO<NoticeVO> pagingVO);
	
	public NoticeVO selectNotice(String postNo);
	
	public int updateNotice(NoticeVO notice);
	
	public int deleteNotice(String postNo);
	
	public List<Map<String, Object>> selectLguList();
}
