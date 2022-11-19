package com.celebback.member.shoplist.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.celebback.XssUtil;
import com.celebback.member.mypage.dao.MypageDAO;
import com.celebback.member.shoplist.dao.ShopDAO;
import com.celebback.vo.ReserveVO;
import com.celebback.vo.ReviewVO;

/**
 * @author 정아영
 * @since 2022. 8. 31.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                    수정자              수정내용
 * --------       --------    ----------------------
 * 2022. 8. 31.     정아영              최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Service
public class ShopServiceImpl implements ShopService {

	@Inject
	ShopDAO shopDao;
	
	@Inject
	MypageDAO mypageDao;
	
	@Override
	public List<ReserveVO> retrieveReviewPossibleList(ReviewVO review) {
		List<ReserveVO> reviewPossibleList = shopDao.selectReviewPossibleList(review);
		return reviewPossibleList;
	}
	
	@Transactional
	@Override
	public void createReview(ReviewVO review) {
		review.setReviewContent(XssUtil.cleanXSS(review.getReviewContent()));
		shopDao.insertReview(review);
		String memId = review.getMemId();
		mypageDao.updateReviewCountPlusToMem(memId);
	}

	@Override
	public List<ReviewVO> retrieveReviewList(String franId) {
		List<ReviewVO> reviewList = shopDao.selectreviewList(franId);
		return reviewList;
	}

	@Override
	public int retrieveFranStarAvg(String franId) {
		return shopDao.selectFranStarAvg(franId);
	}

	@Override
	public void deleteReview(int reviewSn) {
		shopDao.deleteReview(reviewSn);
	}

}
