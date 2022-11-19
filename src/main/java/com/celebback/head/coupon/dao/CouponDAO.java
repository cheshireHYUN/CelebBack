package com.celebback.head.coupon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

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

@Mapper
public interface CouponDAO {
	
	/**
	 * 쿠폰 전체조회
	 * @param pagingVO
	 * @return
	 */
	public List<CpnVO> selectCpnList(PagingVO<CpnVO> pagingVO);
	
	/**
	 * 쿠폰 페이징
	 * @param pagingVO
	 * @return
	 */
	public int selectTotalRecord(PagingVO<CpnVO> pagingVO);
	
	/**
	 * 쿠폰 상세조회
	 * @param cpnId
	 * @return
	 */
	public CpnVO selectCpn(String cpnId);
	
	/**
	 * 쿠폰 수정
	 * @param cpnVO
	 * @return
	 */
	public int updateCpn(CpnVO cpnVO);
	
	/**
	 * 쿠폰 종류 단순 조회
	 * @return
	 */
	public List<Map<String, Object>> selectCpnLgu();
	
	/**
	 * 메뉴 종류 단순 조회
	 * @return
	 */
	public List<Map<String, Object>> selectMenuLgu();

	/**
	 * 쿠폰 등록
	 * @param cpnVO
	 * @return
	 */
	public int insertCpn(CpnVO cpnVO);
	
	/**
	 * 쿠폰 파일 등록
	 * @param cpnVO
	 * @return
	 */
	public int insertAttatch(CpnVO cpnVO);
	
	/**
	 * 쿠폰 삭제
	 * @param cpnId
	 * @return
	 */
	public int deleteCpn(String cpnId);
	
	/**
	 * 쿠폰 발송
	 * @return
	 */
	public int sendCpn(CpnVO cpnVO);

	/**
	 * 일반회원 ID 단순 조회
	 * @return
	 */
	public List<Map<String, Object>> selectMemId();
	
}
