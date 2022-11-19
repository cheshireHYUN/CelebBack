package com.celebback.board.notice.service;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.celebback.board.notice.dao.AttatchDAO;
import com.celebback.board.notice.dao.NoticeDAO;
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
@Service
public class NoticeServiceImpl implements NoticeService {
	@Inject
	NoticeDAO noticeDao;
	
	@Inject
	AttatchDAO attatchDao;
	
	@Value("#{appInfo['attatchPath']}")
	private File saveFolder;
	
	/**
	 * 첨부파일 저장
	 * @param board
	 * @return
	 * @throws IOException
	 */
	private int processAttatches(NoticeVO notice) throws IOException {
		List<AttatchVO> attatchList = notice.getAttatchList();
		if(attatchList==null || attatchList.isEmpty()) return 0;
		
		int rowcnt = attatchDao.insertAttatches(notice); // ATTATCH
		// 2진 데이터(파일 자체) 저장 : d:/saveFiles
		for(AttatchVO attatch : attatchList) {
			attatch.saveTo(saveFolder);
		}
		return rowcnt;
	}
	
	@Override
	public List<NoticeVO> retrieveNoticeListForMember(PagingVO<NoticeVO> pagingVO) {
		pagingVO.setTotalRecord(noticeDao.selectTotalRecordForMember(pagingVO));
		List<NoticeVO> noticeList = noticeDao.selectNoticeListForMember(pagingVO);
		pagingVO.setDataList(noticeList);
		return noticeList;
	}

	@Override
	public NoticeVO retrieveNoticeForMember(String postNo) {
		return noticeDao.selectNoticeForMember(postNo);
	}
	
	@Override
	public List<NoticeVO> retrieveNoticeList(PagingVO<NoticeVO> pagingVO) {
		pagingVO.setTotalRecord(noticeDao.selectTotalRecord(pagingVO));
		List<NoticeVO> noticeList = noticeDao.selectNoticeList(pagingVO);
		pagingVO.setDataList(noticeList);
		return noticeList;
	}
	
	@Override
	public NoticeVO retrieveNotice(String postNo) {
		return noticeDao.selectNotice(postNo);
	}

	@Transactional
	@Override
	public void createNotice(NoticeVO notice) {
		noticeDao.insertNotice(notice);
		try {
			processAttatches(notice); // 첨부파일 처리.
		}catch (IOException e) {
			throw new RuntimeException(e);
		}
	}
	
	@Transactional
	@Override
	public void updateNotice(NoticeVO notice) {
		noticeDao.updateNotice(notice);
		
		try {
			processAttatches(notice);
			removeAttatches(notice);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 첨부파일 삭제 (meta + binary)
	 * @param board
	 */
	private void removeAttatches(NoticeVO notice) { //첨부파일 지우기
		int[] delAttNos = notice.getDelAttNos();
		if(delAttNos==null || delAttNos.length == 0) return;
		
		List<String> saveNames = Arrays.stream(delAttNos).mapToObj((attatchNo)->{
			AttatchVO attatch = attatchDao.selectAttatch(attatchNo);
			return attatch.getAttatchSavename();
		}).collect(Collectors.toList());
		
		attatchDao.deleteAttatches(notice);
		
		for(String saveName : saveNames) {
			File saveFile = new File(saveFolder, saveName);
			FileUtils.deleteQuietly(saveFile);
		}
	}
	
	@Transactional
	@Override
	public void deleteNotice(NoticeVO notice) {
		NoticeVO saved = noticeDao.selectNotice(notice.getPostNo());
		
		int[] delAttNos = saved.getAttatchList().stream().mapToInt((attatch)->attatch.getAttatchNo()).toArray();
		notice.setDelAttNos(delAttNos);
		
		removeAttatches(notice);
		noticeDao.deleteNotice(notice.getPostNo());
	}
	
	@Override
	public AttatchVO downloadAttatch(int attatchNo) {
		AttatchVO attatch = attatchDao.selectAttatch(attatchNo); //요게 현재 다운로드 받으려는 파일
		//해당 상품이 존재하지 않으면 PKNotFoundException 발생시켰었지 근데 여긴 없엉
		if(attatch==null)
			throw new RuntimeException(String.format("%d 첨부파일이 없음", attatchNo));
		return attatch;
	}

}
