package com.celebback.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;

/**
 * @author 정아영
 * @since 2022. 8. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                    수정자              수정내용
 * --------       --------    ----------------------
 * 2022. 8. 5.     정아영              최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Data
public class FrNoticeVO {
	private String franId;
	@NotBlank
	private String postTitle;
	@NotBlank
	private String postContent;
	private String postDate;
	private Integer frannoticeNo;
	
	private int rnum;
	
	private String ownerId;
	
	private String franName;
	
	private FranVO fran;
}
