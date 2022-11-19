package com.celebback.member.shoplist.service;

import java.util.List;

import com.celebback.vo.FrPageVO;
import com.celebback.vo.FranVO;

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

public interface ShopListService {
	
	public List<FranVO> shopList(FrPageVO vo);
	public int totalPage();

}
