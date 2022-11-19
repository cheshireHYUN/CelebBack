package com.celebback.fr.analysis.popular.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.celebback.vo.PopularVO;

/**
 * 
 * @author 최서현
 * @since 2022. 8. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 5.       최서현      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Repository
public class PopularDao {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.celebback.mybatis.mappers.populars";
	
	public int getWishCnt(PopularVO vo) {
		return session.selectOne(namespace+".getWishCnt",vo);
	}
	
	public int getWishCntMonth(PopularVO vo) {
		return session.selectOne(namespace+".getWishCntMonth",vo);
	}
	
	public int getReviewCnt(PopularVO vo) {
		return session.selectOne(namespace+".getReviewCnt",vo);
	}
	
	public int getReviewCntMonth(PopularVO vo) {
		return session.selectOne(namespace+".getReviewCntMonth",vo);
	}

	public List<PopularVO> getMenuCnt(PopularVO vo) {
		return session.selectList(namespace+".getMenuCnt",vo);
	}
	
	
	public List<PopularVO> getAllPcntCnt(PopularVO vo) {
		return session.selectList(namespace+".getAllPcntCnt",vo);
	}
	
	
	public List<PopularVO> getResvPcntCnt(PopularVO vo) {
		return session.selectList(namespace+".getResvPcntCnt",vo);
	}
	
	

}
