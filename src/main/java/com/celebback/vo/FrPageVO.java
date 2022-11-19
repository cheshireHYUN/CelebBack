package com.celebback.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("FrPageVO")
public class FrPageVO {
	
	private int totalNum;
	private int startNum;
	private int endNum;

}
