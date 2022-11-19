package com.celebback.head.fr.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.celebback.vo.ApplyVO;
import com.celebback.vo.ConsultVO;
import com.celebback.vo.FranVO;
import com.celebback.vo.OwnerVO;
import com.celebback.vo.PagingVO;

/**
 * 
 * @author 황단비
 * @since 2022. 8. 4.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자            수정내용
 * --------     --------    ----------------------
 * 2022. 8. 4.       황단비      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface FrDAO {
	/**
	 * 가맹점 전체 조회
	 * @param pagingVO
	 * @return
	 */
	public List<FranVO> selectFranList(PagingVO<FranVO> pagingVO);
	
	/**
	 * 가맹점 관리 목록 페이징
	 * @param pagingVO
	 * @return
	 */
	public int selectTotalRecord(PagingVO<FranVO> pagingVO);
	
	/**
	 * 가맹점 상세 조회
	 * @param franId
	 * @return
	 */
	public FranVO selectFran(String franId);
	
	/**
	 * 가맹점 상태 조회
	 * @return
	 */
	public List<Map<String,Object>> selectFranState();
	
	/**
	 * 가맹점 정보 엑셀 다운로드
	 * @return
	 */
	public List<FranVO> excelDown();
	
	/**
	 * 가맹점 전체 조회 ( 페이징 없이)
	 */
	public List<FranVO> selectAllFranList();
	
	/**
	 * 엑셀 업로드 - CONSULT merge 
	 * @param consultVO
	 * @return
	 */
	public int mergeConsult(ConsultVO consultVO);
	
	/**
	 * 엑셀 업로드 - APPLY merge 
	 * @param applyVO
	 * @return
	 */
	public int mergeApply(ApplyVO applyVO);
	
	/**
	 * 엑셀 업로드 - OWNER merge 
	 * @param ownerVO
	 * @return
	 */
	public int mergeOwner(OwnerVO ownerVO);
	
	/**
	 * 엑셀 업로드 - FRAN merge 
	 * @param franVO
	 * @return
	 */
	public int mergeFran(FranVO franVO);
	
	/**
	 * 지도 좌표 단순 조회
	 * @param pagingVO 
	 * @return
	 */
	public List<FranVO> selectMap(PagingVO<FranVO> pagingVO);
}
