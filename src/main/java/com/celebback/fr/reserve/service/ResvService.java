package com.celebback.fr.reserve.service;

import java.util.List;

import com.celebback.vo.PagingVO;
import com.celebback.vo.ReserveVO;

public interface ResvService {
	
	// 오늘 예약내역 조회
	public List<ReserveVO> retrieveTodayResvList(String franId);
	
	// 예약내역 조회
	public List<ReserveVO> retrieveResvList(PagingVO<ReserveVO> pagingVO);
	
	// 예약내역 상세조회
	public List<ReserveVO> retrieveResv(String resvId);
	
	// 예약요청현황 조회
	public List<ReserveVO> retrieveReqResvList(String franId);
	
	// 예약요청현황 상세조회
	public List<ReserveVO> retrieveReqResv(ReserveVO resvVO);
	
	// 예약요청 수락
	public void modifyAcceptResv(ReserveVO resvVO);
	
	// 예약요청 거절
	public void modifyRejectResv(ReserveVO resvVO);
	
}
