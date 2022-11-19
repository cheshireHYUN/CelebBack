package com.celebback.vo;

import lombok.Data;

@Data
public class FrPaperVO {
	private String paperDate;
	private String ownerId;
	private String franId;
//	private int paperSn;
	private String paperSn; //  가맹점검관리 공문발송때문에 String으로 바꿈
	private PaperInpVO paperInp;
	private PaperVO paper;
	
	private String franName;
}
