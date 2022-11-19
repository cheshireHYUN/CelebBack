package com.celebback.head.frcheck.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.celebback.vo.CheckingVO;
import com.celebback.vo.FrPaperVO;
import com.celebback.vo.PagingVO;
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
@Service
public class FrCheckServiceImpl implements FrCheckService{
	@Inject
	com.celebback.head.frcheck.dao.frCheckDAO frCheckDAO;

	/**
	 * 가맹점점검관리 조회
	 */
	@Override
	public List<CheckingVO> retrieveFrCheckList(PagingVO<CheckingVO> pagingVO) {
		pagingVO.setTotalRecord(frCheckDAO.selectTotalRecord(pagingVO));
		List<CheckingVO> franList = frCheckDAO.selectfrCheckList(pagingVO);
		pagingVO.setDataList(franList);
		return franList;
	}

	/**
	 * 점검 결과 등록
	 */
	@Override
	@Transactional
	public void createFrCheck(CheckingVO checkingVO) {
		frCheckDAO.insertChecking(checkingVO); // checking 
		
		// 점수 미달 시
		if(checkingVO.getCheckIndi() <6 
				|| checkingVO.getCheckFran()<6 
				|| checkingVO.getCheckFood()<6) {
			
			frCheckDAO.insertEduSchChkFail(checkingVO);// edusch
			
			String franName = checkingVO.getFranName();
			FrPaperVO vo = new FrPaperVO();
			vo.setFranName(franName);
			frCheckDAO.insertFrPaper(vo);// frpaper
			
//		frCheckDAO.insertChkFail(checkingVO);// chkfail
		}
	}
	
	/**
	 * 점검 미달 가맹점 공문 발송
	 */
	@Override
	@Transactional
	public void createFrCheckPaper(CheckingVO checkingVO) {
		String franName = checkingVO.getFranName();
		FrPaperVO vo = new FrPaperVO();
		vo.setFranName(franName);
		frCheckDAO.insertFrPaper(vo);// frpaper
	}
}
