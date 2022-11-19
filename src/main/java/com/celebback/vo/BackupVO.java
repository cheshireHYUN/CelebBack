package com.celebback.vo;

import lombok.Data;

@Data
public class BackupVO {

	private String tableName; // 테이블명
	private String columnName; // 컬럼명
	private String columnValue ; // 컬럼값
	
	private String tableDdl;
}
