package com.celebback.board.frNotice.service;

import java.util.List;

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
public interface FrNoticeService {

	public void createFrNotice(FrNoticeVO frNotice);
	
	public String retrieveFranId(String ownerId);
	
	public String retrieveFranName(String franId);
	
	public List<FrNoticeVO> retrieveFrNoticeList(PagingVO<FrNoticeVO> pagingVO);

	public FrNoticeVO retrieveFrNotice(int frannoticeNo);

	public List<FrNoticeVO> retrieveFrNoticeListForHead(PagingVO<FrNoticeVO> pagingVO);
	
	public FrNoticeVO retrieveFrNoticeForHead(int frannoticeNo);
	
	public List<FrNoticeVO> retrieveFrNoticeListForMember(PagingVO<FrNoticeVO> pagingVO);
	
	public void updateFrNotice(FrNoticeVO frNotice);
	
	public void deleteFrNotice(FrNoticeVO frNotice);
}
