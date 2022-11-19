package com.celebback.member.refund.dao;

import org.apache.ibatis.annotations.Mapper;

import com.celebback.vo.RefundVO;

@Mapper
public interface RefundDAO {
	/**
	 * 선결제 여부, 쿠폰 사용 여부 조회
	 * @param payPg
	 * @return
	 */
	public RefundVO selectPayDetail(String payPg);
	
	/**
	 * 예약상태 변경
	 * @param payPg
	 */
	public void updateReserve(String payPg);
	
	/**
	 * 쿠폰 사용상태 변경
	 * @param mycpnId
	 */
	public void updateMyCpn(String mycpnId);
	
	/**
	 * 환불 정보 등록
	 * @param refundVO
	 */
	public void insertRefund(RefundVO refundVO);
	
}
