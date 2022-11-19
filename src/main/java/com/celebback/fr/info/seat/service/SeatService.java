package com.celebback.fr.info.seat.service;

import java.util.List;

import org.springframework.security.core.Authentication;

import com.celebback.vo.SitVO;

/**
 * 
 * @author 최서현
 * @since 2022. 8. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 5.       최서현      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
public interface SeatService {
	
	//등록, 삭제, 조회
	
	public void createSeat(String vo, Authentication authentication);
	public List<SitVO> seatList(String ownerId);
	public List<SitVO> seatList2(String franId);

}
