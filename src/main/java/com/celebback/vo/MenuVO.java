package com.celebback.vo;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

/**
 * 
 * @author 최서현
 * @since 2022. 8. 9.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 9.       최서현      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Data
@Alias("MenuVO")
public class MenuVO {
	
	
	private String menuId;
	private String menuName;
	private Integer menuPrice;
	private String menuText;
	private String menuDate;
	private String menuType;
	private String menuMaterial;
	 
	private String attatchNo;
	private String menuImg;
	private String menuThumbImg;
	private String originalFilename;
	
}
