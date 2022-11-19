package com.celebback.vo;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 
 * @author 황단비
 * @since 2022. 8. 22.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자            수정내용
 * --------     --------    ----------------------
 * 2022. 8. 22.       황단비      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
//
@Data
@EqualsAndHashCode(of= {"franId"})
public class ProfitVO {
	private String franId; 		// 가맹점아이디
	private String ownerId; 	// 가맹점주아이디
	private String franName;
	
	private Integer empCost;	//인건비
	private Integer franCost;	//가맹비
	private Integer shareCost;	//수익쉐어비
	private Integer primeCost;	//판매원가
	private Integer totalSale;	//매출액
	private Integer totalPrime;	//매출원가
	private Integer busiProf;	//영업이익
	private Integer currentProf;//당기순이익
	
	private SimpleSearchCondition simpleCondition;
}
