package com.celebback.member.shoplist.service;

import java.util.List;

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
public interface ShopService {
	
	public List<ReserveVO> retrieveReviewPossibleList(ReviewVO review);
	
	public void createReview(ReviewVO review);
	
	public List<ReviewVO> retrieveReviewList(String franId);
	
	public int retrieveFranStarAvg(String franId);
	
	public void deleteReview(int reviewSn);
}
