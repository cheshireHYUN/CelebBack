package com.celebback.board.frNotice.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.celebback.board.frNotice.dao.FrNoticeDAO;
import com.celebback.member.mypage.dao.MypageDAO;
import com.celebback.vo.FrNoticeVO;
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
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Service
public class FrNoticeServiceImpl implements FrNoticeService {

	@Inject
	FrNoticeDAO frNoticeDao;
	
	@Inject
	MypageDAO mypageDao;

	@Override
	public void createFrNotice(FrNoticeVO frNotice) {
		String franId = retrieveFranId(frNotice.getOwnerId());
		frNotice.setFranId(franId);
		frNoticeDao.insertFrNotice(frNotice);
	}

	@Override
	public String retrieveFranId(String ownerId) {
		return frNoticeDao.selectFranId(ownerId);
	}
	
	@Override
	public String retrieveFranName(String franId) {
		return frNoticeDao.selectFranName(franId);
	}
	
	@Override
	public List<FrNoticeVO> retrieveFrNoticeList(PagingVO<FrNoticeVO> pagingVO) {
		pagingVO.setTotalRecord(frNoticeDao.selectTotalRecord(pagingVO));
		List<FrNoticeVO> frNoticeList = frNoticeDao.selectFrNoticeList(pagingVO);
		pagingVO.setDataList(frNoticeList);
		return frNoticeList;
	}

	@Override
	public FrNoticeVO retrieveFrNotice(int frannoticeNo) {
		return frNoticeDao.selectFrNotice(frannoticeNo);
	}

	@Override
	public List<FrNoticeVO> retrieveFrNoticeListForHead(PagingVO<FrNoticeVO> pagingVO) {
		pagingVO.setTotalRecord(frNoticeDao.selectTotalRecordForHead(pagingVO));
		List<FrNoticeVO> frNoticeList = frNoticeDao.selectFrNoticeListForHead(pagingVO);
		pagingVO.setDataList(frNoticeList);
		return frNoticeList;
	}

	@Override
	public FrNoticeVO retrieveFrNoticeForHead(int frannoticeNo) {
		return frNoticeDao.selectFrNoticeForHead(frannoticeNo);
	}
	
	@Override
	public List<FrNoticeVO> retrieveFrNoticeListForMember(PagingVO<FrNoticeVO> pagingVO) {
		pagingVO.setTotalRecord(frNoticeDao.selectTotalRecordForMember(pagingVO));
		List<FrNoticeVO> frNoticeList = frNoticeDao.selectFrNoticeListForMember(pagingVO);
		pagingVO.setDataList(frNoticeList);
		return frNoticeList;
	}

	@Override
	public void updateFrNotice(FrNoticeVO frNotice) {
		frNoticeDao.updateFrNotice(frNotice);
	}

	@Override
	public void deleteFrNotice(FrNoticeVO frNotice) {
		frNoticeDao.deleteFrNotice(frNotice.getFrannoticeNo());
	}

}
