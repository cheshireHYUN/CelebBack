package com.celebback.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("BillVO")
public class BillVO {
	
	private String selectedDate;
	private String billNo;
	private String franId;
	private Integer billCost;
	private String billDate;
	
	// 추가
	private Integer month1;
	private Integer month2;
	private Integer month3;
	private Integer month4;
	private Integer month5;
	private Integer month6;
	private Integer month7;
	private Integer month8;
	private Integer month9;
	private Integer month10;
	private Integer month11;
	private Integer month12;
	
}
