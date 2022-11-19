package com.celebback.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of= {"mycpnId"})
@Alias("MyCpnVO")
public class MyCpnVO {
	private String mycpnId;
	private String cpnId;
	private String memId;
	private String mycpnGetdate;
	private String mycpnEndate;
	private String mycpnUse;
	
	// 쿠폰사용 관련
	private String cpnName;
	private String cpnContent;
	private String menuId;
	private String lguName;
	
}
