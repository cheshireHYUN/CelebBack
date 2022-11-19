package com.celebback.head.coupon.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.celebback.vo.CpnVO;
import com.celebback.vo.PagingVO;

/**
 * 
 * @author 황단비
 * @since 2022. 8. 17.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자            수정내용
 * --------     --------    ----------------------
 * 2022. 8. 17.       황단비      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
public interface CouponService {
	
	/**
	 * 쿠폰 전체조회
	 * @param pagingVO
	 * @return 
	 */
	public List<CpnVO> retrieveCpnList(PagingVO<CpnVO> pagingVO);
	
	/**
	 * 쿠폰 상세조회
	 * @param cpnVO
	 * @return
	 */
	public CpnVO retrieveCpn(String cpnId);
	
	/**
	 * 쿠폰 수정
	 * @param cpnVO
	 * @return
	 */
	public void modifyCpn(CpnVO cpnVO);
	
	/**
	 * 쿠폰 등록
	 * @param cpnVO
	 * @return
	 */
	public void createCpn(CpnVO cpnVO, MultipartHttpServletRequest request) throws IOException;
	
	/**
	 * 쿠폰 삭제
	 * @param cpnId
	 */
	public void deleteCpn(String cpnId);
	
	/**
	 * 쿠폰 발송
	 * @param cpnVO
	 */
	public void sendCpn(CpnVO cpnVO);

}
