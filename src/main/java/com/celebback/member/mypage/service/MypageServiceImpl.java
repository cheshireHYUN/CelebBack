package com.celebback.member.mypage.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.celebback.member.mypage.dao.MypageDAO;
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
 * 2022. 9. 2.      정아영              리뷰 관련 추가
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Service
public class MypageServiceImpl implements MypageService {

	@Inject
	MypageDAO mypageDao;
	
	@Override
	public MemVO2 retrieveMem(String memId) {
		return mypageDao.selectMemName(memId);
	}
	
	@Override
	public List<NotificationVO> retrieveNotificationList(String memId) {
		List<NotificationVO> notificationList = mypageDao.selectNotificationList(memId);
		return notificationList;
	}

	@Override
	public int totalNotifications(String memId) {
		int totalNoti = mypageDao.totalNotifications(memId);
		return totalNoti;
	}
	
	@Override
	public void updateNotification(NotificationVO noti) {
		mypageDao.updateNotification(noti);
	}

	@Override
	public void createNotification(NotificationVO noti) {
		int count = mypageDao.selectInsertCount(noti.getMemId());
		if(count!=0) {
			for(int i=0; i<=count; i++) {
				mypageDao.insertNotification(noti);
			}
		}
	}

	@Override
	public void deleteNullRow(String memId) {
		mypageDao.deleteNullRow(memId);
	}

	@Override
	public ReserveVO retrieveReserveRemainDate(String memId) {
		return mypageDao.selectReserveRemainDate(memId);
	}
	
	@Override
	public List<ReserveVO> retrieveReserveList(String memId) {
		List<ReserveVO> reserveList = mypageDao.selectReserveList(memId);
		return reserveList;
	}

	@Override
	public ReserveVO retrieveReserve(String resvId) {
		return mypageDao.selectReserve(resvId);
	}

	@Override
	public List<ReserveVO> retrieveReserveMenuList(String resvId) {
		List<ReserveVO> reserveMenuList = mypageDao.selectReserveMenuList(resvId);
		for (ReserveVO reserveVO : reserveMenuList) {
			reserveVO.setSubtotalSum(mypageDao.selectSubtotalSum(resvId));
		}
		return reserveMenuList;
	}
	
	@Override
	public int retrieveBill(String resvId) {
		return mypageDao.selectBill(resvId);
	}

	@Override
	public void deleteReserve(ReserveVO resv) {
		String resvId = resv.getResvId();
		mypageDao.deleteMorder(resvId);
		mypageDao.updateReserveStatus(resvId);
	}

	@Override
	public MemVO2 retrieveStamp(String memId) {
		return mypageDao.selectStamp(memId);
	}

	@Override
	public void updateStampToResv() {
		mypageDao.updateStampToResv();
	}

	@Override
	public void updateStampToMem(String memId) {
//		MemVO2 stampVO = retrieveStamp(memId);
//		if(stampVO!=null) {
//			Integer stampCnt = stampVO.getMemStpcnt();
//			Integer stpCpn = stampVO.getStpCpn();
			int updateStamp = mypageDao.selectUpdateStamp(memId);
//			int minus = updateStamp - 10;
//			if(updateStamp>=10) {
//				
//			}
//			if(stpCpn!=10) {
//				if(stampCnt!=minus) {
			if(updateStamp!=0) {
				mypageDao.updateStampToMem(memId);
				mypageDao.updateResvStpcnt(memId);
				
			}
//				}
//			}
//		}
//		createStampCoupon(memId);
	}

	@Override
	public void createStampCoupon(String memId) {
//		Integer stamp = retrieveStamp(memId);
		MemVO2 stampVO = retrieveStamp(memId);
		if(stampVO!=null) {
			Integer stampCnt = stampVO.getMemStpcnt();
			Integer stpCpn = stampVO.getStpCpn();
			if(stampCnt!=null) {
				if(stampCnt>=10) {
					if(stpCpn!=1&&stpCpn!=5&&stpCpn!=10) {
						mypageDao.insertOneStampCoupon(memId);
//					mypageDao.updateOneStampCoupon(memId);
						mypageDao.insertFiveStampCoupon(memId);
//					mypageDao.updateFiveStampCoupon(memId);
						mypageDao.insertTenStampCoupon(memId);
						mypageDao.updateTenStampCoupon(memId);
					}else if(stpCpn!=5&&stpCpn!=10) {
						mypageDao.insertFiveStampCoupon(memId);
//					mypageDao.updateFiveStampCoupon(memId);
						mypageDao.insertTenStampCoupon(memId);
						mypageDao.updateTenStampCoupon(memId);
					}else if(stpCpn!=10) {
						mypageDao.insertTenStampCoupon(memId);
						mypageDao.updateTenStampCoupon(memId);
					}
				}else if(stampCnt>=5) {
					if(stpCpn!=1&&stpCpn!=5) {
						mypageDao.insertOneStampCoupon(memId);
//					mypageDao.updateOneStampCoupon(memId);
						mypageDao.insertFiveStampCoupon(memId);
						mypageDao.updateFiveStampCoupon(memId);
					}else if(stpCpn!=5) {
						mypageDao.insertFiveStampCoupon(memId);
						mypageDao.updateFiveStampCoupon(memId);
					}
				}else if(stampCnt>=1 && (stpCpn==0||stpCpn==10)) {
					mypageDao.insertOneStampCoupon(memId);
					mypageDao.updateOneStampCoupon(memId);
				}
			}
		}
	}
	
	@Override
	public List<MyCpnVO> retrieveMycouponList(String memId) {
		List<MyCpnVO> mycouponList = mypageDao.selectMycouponList(memId);
		return mycouponList;
	}

	@Override
	public void updateReviewCountPlusToMem(String memId) {
		mypageDao.updateReviewCountPlusToMem(memId);
	}
	
	@Override
	public void updateReviewCountMinusToMem(String memId) {
		mypageDao.updateReviewCountMinusToMem(memId);
	}
	
	@Override
	public void createReviewCoupon(String memId) {
		MemVO2 reviewContainer = mypageDao.selectReviewCount(memId);
		if(reviewContainer!=null) {
			Integer nowDate = reviewContainer.getNowDate();
			Integer rvcnt = reviewContainer.getMemRvcnt();
			if(nowDate==01) {
				if(rvcnt>=10) {
					mypageDao.updateMemberGradeSuperCeleb(memId);
					mypageDao.insertPrepCelebCoupon(memId);
					mypageDao.insertGeneralCelebCoupon(memId);
					mypageDao.insertSuperCelebCoupon(memId);
				}else if(rvcnt>=5) {
					mypageDao.updateMemberGradeGeneralCeleb(memId);
					mypageDao.insertPrepCelebCoupon(memId);
					mypageDao.insertGeneralCelebCoupon(memId);
				}else if(rvcnt>=1) {
					mypageDao.updateMemberGradePrepCeleb(memId);
					mypageDao.insertPrepCelebCoupon(memId);
				}
			}
		}
	}
	
	@Override
	public List<ReviewVO> retrieveMyReviewList(String memId) {
		List<ReviewVO> myReviewList = mypageDao.selectMyReviewList(memId);
		return myReviewList;
	}

	@Override
	public List<WishVO> retrieveFranWishList(String memId) {
		List<WishVO> franWishList = mypageDao.selectFranWishList(memId);
		return franWishList;
	}
	
	@Override
	public void createFranWish(WishVO wish) {
		mypageDao.insertFranWish(wish);
	}
	
	@Override
	public void deleteFranWish(WishVO wish) {
		mypageDao.deleteFranWish(wish);
	}
	
	@Override
	public List<FranVO> retrieveFranInfo() {
		List<FranVO> franInfo = mypageDao.selectFranInfo();
		return franInfo;
	}

	@Override
	public MemVO2 retrieveMyAccount(String memId) {
		return mypageDao.selectMyAccount(memId);
	}
}
