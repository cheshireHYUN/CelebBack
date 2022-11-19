package com.celebback.fr.reserve.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.celebback.vo.FrOrderVO;
import com.celebback.vo.PagingVO;
import com.celebback.vo.ReserveVO;

@Mapper
public interface ResvDAO {
	
	/**
	 * 오늘 예약내역 조회
	 * @param franId
	 * @return
	 */
	public List<ReserveVO> selectTodayResvList(String franId);
	
	/**
	 * 예약내역 조회
	 * @param pagingVO
	 * @return
	 */
	public List<ReserveVO> selectResvList(PagingVO<ReserveVO> pagingVO);
	
	/**
	 * 예약내역 페이징
	 * @param pagingVO
	 * @return
	 */
	public int selecTotalRecord(PagingVO<ReserveVO> pagingVO);

	/**
	 * 예약내역 상세조회
	 * @param resvId
	 * @return
	 */
	public List<ReserveVO> selectResv(String resvId);
	
	/**
	 * 예약요청현황 조회
	 * @param franId
	 * @return
	 */
	public List<ReserveVO> selectReqResvList(String franId);
	
	/**
	 * 예약요청현황 상세조회
	 * @param resvVO
	 * @return
	 */
	public List<ReserveVO> selectReqResv(ReserveVO resvVO);
	
	/**
	 * 예약요청 수락
	 * @param resvId
	 * @return
	 */
	public int updateAcceptResv(ReserveVO resvVO);
	
	/**
	 * 예약요청 거절
	 * @param resvId
	 * @return
	 */
	public int updateRejectResv(ReserveVO resvVO);
	
	
}
