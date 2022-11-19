package com.celebback.vo;

import lombok.Data;

/**
 * @author 정아영
 * @since 2022. 9. 1.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                    수정자              수정내용
 * --------       --------    ----------------------
 * 2022. 9. 1.     정아영              최초작성
 * 2022. 9. 2.     정아영              franName, resvDate 추가
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Data
public class ReviewVO {
	private Integer reviewSn;
	private String franId;
	private String memId;
	private String reviewContent;
	private Integer reviewStar;
	private String reviewDate;
	private String resvId;
	
	private String franName;
	private String resvDate;
}
