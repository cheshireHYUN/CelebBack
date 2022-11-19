package com.celebback.vo;

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
public class WishVO {
	private String franId;
	private String memId;
	
	private String status;
}
