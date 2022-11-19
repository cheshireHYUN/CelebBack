package com.celebback.fr.paper.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.celebback.fr.paper.dao.FrPaperDAO;
import com.celebback.vo.FrPaperVO;
import com.celebback.vo.PagingVO;
import com.celebback.vo.PaperVO;

@Service
public class FrPaperServiceImpl implements FrPaperService{
	@Inject
	FrPaperDAO frPaperDAO;
	
	/**
	 * 공문수신함 전체조회
	 */
	@Override
	public List<FrPaperVO> retrieveFrPaperList(PagingVO<FrPaperVO> pagingVO) {

		pagingVO.setTotalRecord(frPaperDAO.selectTotalRecord(pagingVO));
		List<FrPaperVO> frPaperList = frPaperDAO.selectFrPaperList(pagingVO);
		pagingVO.setDataList(frPaperList);
		return frPaperList;
		
	}

	/**
	 * 공문수신함 상세조회
	 */
	@Override
	public FrPaperVO retrieveFrPaper(int paperSn) {
		return frPaperDAO.selectFrPaper(paperSn);
	}
	
	

}
