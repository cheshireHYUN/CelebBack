package com.celebback.head.paper.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.celebback.board.notice.dao.AttatchDAO;
import com.celebback.head.paper.dao.PaperDAO;
import com.celebback.vo.AttatchVO;
import com.celebback.vo.NoticeVO;
import com.celebback.vo.OwnerVO;
import com.celebback.vo.PagingVO;
import com.celebback.vo.PaperVO;

import lombok.extern.slf4j.Slf4j;
/**
 * 
 * @author 황단비
 * @since 2022. 8. 16.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자            수정내용
 * --------     --------    ----------------------
 * 2022. 8. 16.       황단비      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Service
@Slf4j
public class PaperServiceImpl implements PaperService{
	@Inject
	PaperDAO paperDAO;
	@Inject
	AttatchDAO attatchDAO;
	
	/**
	 * 공문 전체 조회
	 */
	public List<PaperVO> retrievePaper(PagingVO<PaperVO> pagingVO){
		pagingVO.setTotalRecord(paperDAO.selectTotalRecord(pagingVO));
		List<PaperVO> paperList = paperDAO.selectPaperList(pagingVO);
		pagingVO.setDataList(paperList);
		return paperList;
	}

	/**
	 * 공문 상세 조회
	 */
	@Override
	public PaperVO retrievePaper(String paperId) {
		return paperDAO.selectPaper(paperId);
	}

	/**
	 * 공문 등록
	 * @throws IOException 
	 */
	@Transactional
	@Override
	public void insertPaper(PaperVO paperVO, MultipartHttpServletRequest request) throws IOException {
		// PAPER INSERT
		paperDAO.insertPaper(paperVO);
		
		if(request.getFileMap()!=null) {
			MultipartFile file = request.getFile("atchFile");
			paperVO.setAttatch(new AttatchVO(file));
			
			// 파일 메타데이터 저장
			paperDAO.insertAttatch(paperVO);
			
			// 파일 이진데이터 저장
			File savePath = new File("D:/contents");
			paperVO.getAttatch().saveTo(savePath);
		}
	}

	/**
	 * 공문 수정
	 */
	@Override
	public void modifyPaper(PaperVO paperVO) {
		paperDAO.updatePaper(paperVO);
	}

	/**
	 * 공문 삭제
	 */
	@Override
	@Transactional
	public void deletePaper(String paperId) {
		paperDAO.delBeforePaper(paperId);
		paperDAO.deletePaper(paperId);
	}
	
	/**
	 * 공문 발송
	 * @throws IOException 
	 */
	@Override
	public void sendPaper(PaperVO paperVO) throws IOException {
		// PAPER INSERT
		paperDAO.sendPaper(paperVO);
		
		// 읽을 파일 SELECT
//		AttatchVO attatch = attatchDAO.selectAttatchPK(paperVO.getPaperId());
//		String saveName = attatch.getAttatchSavename();
//		
//		File source = new File("D://contents/"+saveName);
//		
//		// PAPERINP INSERT
//		BufferedReader reader = new BufferedReader(new FileReader(source));
//		String line=null;
//		
//		String regex = "\\$\\{\\w{1,}\\}";
//		Pattern pattern = Pattern.compile(regex);
//		Matcher matcher = null; 
//		
//		while((line=reader.readLine())!=null) {
//			matcher = pattern.matcher(line); 
//			while(matcher.find()) {
//				// PAPERINP insert
//				String group = matcher.group(); // ${ownerName} 출력
//				String first = null;
//				String propGetter = null;
//				if(group.startsWith("owner") || group.startsWith("consultSn")) { // ownerVO인 경우
//					OwnerVO owner = new OwnerVO();
////					owner.getClass().getMethod(name, parameterTypes)
//					first = group.substring(0, 1);
////					propGetter = "get"+first + group.substring(1); // getOwnerId
//					
//				}
//				
////				log.info("group : "+matcher.group());
////				log.info("start : "+matcher.start());
////				log.info("end : "+matcher.end());
//			}
//		}
	}

}
