package com.celebback.member.mypage.service;

import java.util.List;

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
public interface MypageService {
	
	public MemVO2 retrieveMem(String memId);
	
	/* 마이페이지 메인 알림 */
	public List<NotificationVO> retrieveNotificationList(String memId);
	
	public int totalNotifications(String memId);
	
	public void updateNotification(NotificationVO noti);
	
	public void createNotification(NotificationVO noti);
	
	public void deleteNullRow(String memId);
	
	/* 예약 */
	public ReserveVO retrieveReserveRemainDate(String memId);
	
	public List<ReserveVO> retrieveReserveList(String memId);
	
	public ReserveVO retrieveReserve(String resvId);
	
	public List<ReserveVO> retrieveReserveMenuList(String resvId);
	
	public int retrieveBill(String resvId);
	
	public void deleteReserve(ReserveVO resv);
	
	/* 스탬프 및 쿠폰 */
	public MemVO2 retrieveStamp(String memId);
	
	public void updateStampToResv();
	
	public void updateStampToMem(String memId);
	
	public void createStampCoupon(String memId);
	
	public List<MyCpnVO> retrieveMycouponList(String memId);
	
	public void updateReviewCountPlusToMem(String memId);
	public void updateReviewCountMinusToMem(String memId);
	
	public void createReviewCoupon(String memId);
	
	/* 리뷰 */
	public List<ReviewVO> retrieveMyReviewList(String memId);
	
	/* 찜 */
	public List<WishVO> retrieveFranWishList(String memId);
	
	public void createFranWish(WishVO wish);

	public void deleteFranWish(WishVO wish);
	
	public List<FranVO> retrieveFranInfo();
	
	/* 개인정보 변경 */
	public MemVO2 retrieveMyAccount(String memId);
}
