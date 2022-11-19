package com.celebback.fr.atOrder.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.celebback.vo.AtOrderVO;

/**
 * 
 * @author 이혜원
 * @since 2022. 8. 9.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 9.       이혜원      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface AtOrderDAO {
	
	/**
	 * 자동발주목록 조회
	 * @return
	 */
	public List<AtOrderVO> selectAtOrderList(String authName);
	
	/**
	 * 자동발주목록 수정
	 * @param buyerProdId
	 * @return
	 */
	public void updateAtOrder(HashMap<String, String> atOrderMap);
	
	public String selectFranId(String authName);

}
