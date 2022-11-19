package com.celebback.vo;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * 키워드 검색, 체크박스 검색 VO
 *
 */
@Data
public class SimpleSearchCondition {
	
	private String searchType;
	private String searchWord;
	private Integer searchWord2;
	private String searchSelect;
	private String[] searchSelectArr;
	private String[] searchSelectArr2;
	private String searchStartDate;
	private String searchEndDate;
	private String searchFranName;
	
	
	
	// 체크박스 없는 생성자
	public SimpleSearchCondition(String searchType, String searchWord, String searchSelect) {
		super();
		this.searchType = searchType;
		this.searchWord = searchWord;
		this.searchSelect = searchSelect;
	}
	
	// 체크박스 있는 생성자
	public SimpleSearchCondition(String searchType, String searchWord, String searchSelect, String[] searchSelectArr) {
		super();
		this.searchType = searchType;
		this.searchWord = searchWord;
		this.searchSelect = searchSelect;
		this.searchSelectArr = searchSelectArr;
	}
	// 체크박스 1, 검색 1, 날짜
	public SimpleSearchCondition(String searchType, String searchWord, String searchSelect, String[] searchSelectArr,String searchStartDate, String searchEndDate) {
		super();
		this.searchType = searchType;
		this.searchWord = searchWord;
		this.searchSelect = searchSelect;
		this.searchSelectArr = searchSelectArr;
		this.searchStartDate = searchStartDate;
		this.searchEndDate = searchEndDate;
	}
	
	// 체크박스 두개 있는 생성자
	public SimpleSearchCondition(String searchType, String searchWord, String[] searchSelectArr, String[] searchSelectArr2) {
		super();
		this.searchType = searchType;
		this.searchWord = searchWord;
		this.searchSelectArr = searchSelectArr;
		this.searchSelectArr2 = searchSelectArr2;
	}
	
	//  
	public SimpleSearchCondition(String searchWord, Integer searchWord2) {
		super();
		this.searchWord = searchWord;
		this.searchWord2 = searchWord2;
	}

	public SimpleSearchCondition(String searchType, String searchWord) {
		super();
		this.searchType = searchType;
		this.searchWord = searchWord;
	}

	public SimpleSearchCondition(String searchStartDate, String searchEndDate, String searchType, String searchWord) {
		super();
		this.searchType = searchType;
		this.searchWord = searchWord;
		this.searchStartDate = searchStartDate;
		this.searchEndDate = searchEndDate;
	}

	public SimpleSearchCondition(String searchStartDate, String searchEndDate, String searchFranName, String searchType, String searchWord) {
		super();
		this.searchType = searchType;
		this.searchWord = searchWord;
		this.searchStartDate = searchStartDate;
		this.searchEndDate = searchEndDate;
		this.searchFranName = searchFranName;
	}

	
}
