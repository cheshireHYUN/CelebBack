package com.celebback.board.frNotice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.celebback.vo.FrNoticeVO;
import com.celebback.vo.PagingVO;

@Mapper
public interface FrNoticeDAO {
	
	public int insertFrNotice(FrNoticeVO frNotice);

	public String selectFranId(String ownerId);
	
	public String selectFranName(String franId);
	
	/* SELECT */
	/* 가맹점 대시보드 */
	public int selectTotalRecord(PagingVO<FrNoticeVO> pagingVO);
	
	public List<FrNoticeVO> selectFrNoticeList(PagingVO<FrNoticeVO> pagingVO);
	
	public FrNoticeVO selectFrNotice(int frannoticeNo);
	
	/* 본사 대시보드 */
	public int selectTotalRecordForHead(PagingVO<FrNoticeVO> pagingVO);
	
	public List<FrNoticeVO> selectFrNoticeListForHead(PagingVO<FrNoticeVO> pagingVO);
	
	public FrNoticeVO selectFrNoticeForHead(int frannoticeNo);
	
	/* 일반회원 */
	public int selectTotalRecordForMember(PagingVO<FrNoticeVO> pagingVO);
	
	public List<FrNoticeVO> selectFrNoticeListForMember(PagingVO<FrNoticeVO> pagingVO);
	/* SELECT END */
	
	public int updateFrNotice(FrNoticeVO frNotice);
	
	public int deleteFrNotice(int frannoticeNo);
	
	public List<Map<String, String>> selectFranNameList();
}
