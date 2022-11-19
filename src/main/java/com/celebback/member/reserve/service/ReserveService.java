package com.celebback.member.reserve.service;

import java.util.List;

import com.celebback.vo.FranVO;
import com.celebback.vo.MyCpnVO;
import com.celebback.vo.ResvInfoVO;

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
public interface ReserveService {
	
	public FranVO franTimeInfo(String franId);
	public List<String> reserveSitList(ResvInfoVO vo);
	public List<MyCpnVO> myUnusedCpn(String memId);
	public void resvAndMorderSave(ResvInfoVO vo);
}
