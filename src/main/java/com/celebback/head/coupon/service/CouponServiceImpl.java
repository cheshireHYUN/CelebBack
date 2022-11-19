package com.celebback.head.coupon.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.celebback.head.coupon.dao.CouponDAO;
import com.celebback.vo.AttatchVO;
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
@Service
public class CouponServiceImpl implements CouponService{
	@Inject
	CouponDAO cpnDAO;

	/**
	 * 쿠폰 전체조회
	 */
	@Override
	public List<CpnVO> retrieveCpnList(PagingVO<CpnVO> pagingVO) {
		pagingVO.setTotalRecord(cpnDAO.selectTotalRecord(pagingVO));
		List<CpnVO> cpnList = cpnDAO.selectCpnList(pagingVO);
		pagingVO.setDataList(cpnList);
		return cpnList;
	}

	/**
	 * 쿠폰 상세조회
	 */
	@Override
	public CpnVO retrieveCpn(String cpnId) {
		return cpnDAO.selectCpn(cpnId);
	}

	/**
	 * 쿠폰 수정
	 */
	@Override
	public void modifyCpn(CpnVO cpnVO) {
		cpnDAO.updateCpn(cpnVO);
	}

	/**
	 * 쿠폰 등록
	 */
	@Override
	@Transactional
	public void createCpn(CpnVO cpnVO, MultipartHttpServletRequest request) throws IOException {
		// CPN insert
		cpnDAO.insertCpn(cpnVO);
		
		if(request.getFileMap()!=null) {
			MultipartFile file = request.getFile("atchFile");
			cpnVO.setAttatch(new AttatchVO(file));
			
			// 파일 메타데이터 저장
			cpnDAO.insertAttatch(cpnVO);
			
			// 파일 이진데이터 저장
			File savePath = new File("D:/contents");
			cpnVO.getAttatch().saveTo(savePath);
		}
	}

	/**
	 * 쿠폰 삭제
	 */
	@Override
	public void deleteCpn(String cpnId) {
		cpnDAO.deleteCpn(cpnId);
	}

	/**
	 * 쿠폰 발송
	 */
	@Override
	@Transactional
	public void sendCpn(CpnVO cpnVO) {
		cpnDAO.sendCpn(cpnVO);
	}

}
