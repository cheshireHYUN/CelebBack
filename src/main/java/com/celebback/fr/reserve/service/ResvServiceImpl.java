package com.celebback.fr.reserve.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.celebback.fr.reserve.dao.ResvDAO;
import com.celebback.vo.FrOrderVO;
import com.celebback.vo.PagingVO;
import com.celebback.vo.ReserveVO;

@Service
public class ResvServiceImpl implements ResvService{
	@Inject
	ResvDAO reserveDAO;

	/**
	 * 오늘 예약내역 조회
	 */
	@Override
	public List<ReserveVO> retrieveTodayResvList(String franId) {
		List<ReserveVO> todayResvList = reserveDAO.selectTodayResvList(franId);
		return todayResvList;
	}
	
	/**
	 * 예약내역 조회
	 */
	@Override
	public List<ReserveVO> retrieveResvList(PagingVO<ReserveVO> pagingVO) {
		pagingVO.setTotalRecord(reserveDAO.selecTotalRecord(pagingVO));
		List<ReserveVO> resvList = reserveDAO.selectResvList(pagingVO);
		pagingVO.setDataList(resvList);
		return resvList;
	}

	@Override
	public List<ReserveVO> retrieveResv(String resvId) {
		List<ReserveVO> resvDeatail = reserveDAO.selectResv(resvId);
		return resvDeatail;
	}

	/**
	 * 예약요청현황 조회
	 */
	@Override
	public List<ReserveVO> retrieveReqResvList(String franId) {
		List<ReserveVO> reqResvList = reserveDAO.selectReqResvList(franId);
		return reqResvList;
	}

	/**
	 * 예약요청현황 상세조회
	 */
	@Override
	public List<ReserveVO> retrieveReqResv(ReserveVO resvVO) {
		List<ReserveVO> reqResvDetail = reserveDAO.selectReqResv(resvVO);
		return reqResvDetail;
	}

	/**
	 * 예약요청 수락
	 */
	@Override
	public void modifyAcceptResv(ReserveVO resvVO) {
		reserveDAO.updateAcceptResv(resvVO);
	}

	/**
	 * 예약요청 거절
	 */
	@Override
	public void modifyRejectResv(ReserveVO resvVO) {
		reserveDAO.updateRejectResv(resvVO);
		
	}

	


}
