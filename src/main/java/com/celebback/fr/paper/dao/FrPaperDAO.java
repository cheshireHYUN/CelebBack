package com.celebback.fr.paper.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.celebback.vo.FrPaperVO;
import com.celebback.vo.PagingVO;

@Mapper
public interface FrPaperDAO {
	
	/**
	 * 공문수신함 전체조회
	 * @param pagingVO
	 * @return
	 */
	public List<FrPaperVO> selectFrPaperList(PagingVO<FrPaperVO> pagingVO);
	
	/**
	 * 공문수신함 cnt
	 * @param FrPaperVO
	 * @return
	 */
	public int selectTotalRecord(PagingVO<FrPaperVO> FrPaperVO); 
	
	/**
	 * 공문수신함 상세조회
	 */
	public FrPaperVO selectFrPaper(int paperSn);
}
