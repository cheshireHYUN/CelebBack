package com.celebback.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
/**
 * 
 * @author 최서현
 * @since 2022. 8. 10.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 10.       최서현      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */


@Data
@Alias("MaterialVO")
public class MaterialVO {
	
	
	private String buyerprodId;
	private String menuId;
	private Integer materialCnt; 
	

}
