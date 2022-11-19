package com.celebback.member.mypage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.celebback.vo.FranVO;
import com.celebback.vo.MemVO2;
import com.celebback.vo.MyCpnVO;
import com.celebback.vo.NotificationVO;
import com.celebback.vo.ReserveVO;
import com.celebback.vo.ReviewVO;
import com.celebback.vo.WishVO;

/**
 * @author 정아영
 * @since 2022. 8. 17.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                    수정자              수정내용
 * --------       --------    ----------------------
 * 2022. 8. 17.     정아영              최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface MypageDAO {
	/*
	 * 1. 가맹점 공지 알림 조회
	 * 2. 개인정보 수정
	 * 3. 찜
	 * 4. 예약내역
	 * 5. 스탬프 및 쿠폰
	 * 6. 리뷰
	 * 7. 작성글 및 댓글
	 */
	public MemVO2 selectMemName(String memId);
	
	/* 마이페이지 메인 알림 */
	public List<NotificationVO> selectNotificationList(String memId);
	
	public int totalNotifications(String memId);
	
	public int updateNotification(NotificationVO noti);
	
	public int selectInsertCount(String memId); 
	
	public int insertNotification(NotificationVO noti);
	
	public int deleteNullRow(String memId);

	/* 예약 */
	public ReserveVO selectReserveRemainDate(String memId);
	
	public List<ReserveVO> selectReserveList(String memId);
	
	public ReserveVO selectReserve(String resvId);
	
	public List<ReserveVO> selectReserveMenuList(String resvId);
	
	public int selectSubtotalSum(String resvId);
	public int selectBill(String resvId);
	
	public int deleteMorder(String resvId);
	public int updateReserveStatus(String resvId);
	
	/* 스탬프 및 쿠폰 */
	public MemVO2 selectStamp(String memId);
	
	public void updateStampToResv();
	
	public int selectUpdateStamp(String memId);
	
	public void updateStampToMem(String memId);
	
	public void updateResvStpcnt(String memId);
	
	public void insertOneStampCoupon(String memId);
	public void insertFiveStampCoupon(String memId);
	public void insertTenStampCoupon(String memId);
	
	public void updateOneStampCoupon(String memId);
	public void updateFiveStampCoupon(String memId);
	public void updateTenStampCoupon(String memId);
	
	public List<MyCpnVO> selectMycouponList(String memId);
	
	public void updateReviewCountPlusToMem(String memId);
	public void updateReviewCountMinusToMem(String memId);
	
	public void insertPrepCelebCoupon(String memId);
	public void insertGeneralCelebCoupon(String memId);
	public void insertSuperCelebCoupon(String memId);
	
	/* 리뷰 */
	public MemVO2 selectReviewCount(String memId);
	
	public List<ReviewVO> selectMyReviewList(String memId);
	
	public void updateMemberGradePrepCeleb(String memId);
	public void updateMemberGradeGeneralCeleb(String memId);
	public void updateMemberGradeSuperCeleb(String memId);
	
	/* 찜 */
	public List<WishVO> selectFranWishList(String memId);
	
	public void insertFranWish(WishVO wish);
	
	public void deleteFranWish(WishVO wish);
	
	public List<FranVO> selectFranInfo();
	
	/* 개인정보 변경 */
	public MemVO2 selectMyAccount(String memId);
}
