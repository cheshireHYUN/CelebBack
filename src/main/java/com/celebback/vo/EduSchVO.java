package com.celebback.vo;

import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
/**
 * 
 * @author 황단비
 * @since 2022. 8. 19.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자            수정내용
 * --------     --------    ----------------------
 * 2022. 8. 19.       황단비      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Data
@EqualsAndHashCode(of= {"eduSn"})
public class EduSchVO {
	private String ownerId;
	private String eduSn;
	private String eduId;
	private String eduTc;
	private String eduDate;
	private String eduLoca;
	private String eduFran;
	public List<ChkFailVO> chkFail;
}
