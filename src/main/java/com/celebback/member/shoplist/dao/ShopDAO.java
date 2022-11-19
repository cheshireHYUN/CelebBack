package com.celebback.member.shoplist.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

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
@Mapper
public interface ShopDAO {
	
	public List<ReserveVO> selectReviewPossibleList(ReviewVO review);
	
	public void insertReview(ReviewVO review);
	
	public List<ReviewVO> selectreviewList(String franId);
	
	public int selectFranStarAvg(String franId);
	
	public int deleteReview(int reviewSn);
}
