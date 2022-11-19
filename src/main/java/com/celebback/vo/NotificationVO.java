package com.celebback.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;

/**
 * @author 정아영
 * @since 2022. 8. 18.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                    수정자              수정내용
 * --------       --------    ----------------------
 * 2022. 8. 18.     정아영              최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Data
public class NotificationVO {
	@NotBlank
	private Integer notiNo;
	@NotBlank
	private String memId;
	@NotBlank
	private String createdAt;
	private String readAt;
	@NotBlank
	private Integer frannoticeNo;
	
	private String postTitle;
	private String postDate;
	
	private Integer totalNoti;
	
	private String franName;
	private String franId;
	
	private FrNoticeVO frnotice;
	private WishVO wish;
	private FranVO fran;
	
}
