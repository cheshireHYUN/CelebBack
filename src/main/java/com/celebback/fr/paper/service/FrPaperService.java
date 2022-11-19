package com.celebback.fr.paper.service;

import java.util.List;

import com.celebback.vo.FrPaperVO;
import com.celebback.vo.PagingVO;

public interface FrPaperService {
	
	/**
	 * 공문수신함 전체 조회
	 * @param pagingVO
	 * @return
	 */
	public List<FrPaperVO> retrieveFrPaperList(PagingVO<FrPaperVO> pagingVO);
	
	/**
	 * 공문수신함 상세조회
	 * @param paperSn
	 * @return
	 */
	public FrPaperVO retrieveFrPaper(int paperSn);
	
}
