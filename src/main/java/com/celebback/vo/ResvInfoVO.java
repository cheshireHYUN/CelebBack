package com.celebback.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("ResvInfoVO")
public class ResvInfoVO {
	
	// 계정정보
	private String franId;
	private String memId;

	// 예약한 날짜정보
	private String year;
	private String month;
	private String day;
	private String time;
	private String resvDate;
	// 제출일시
	private String resvAccDate;

	// 선택한 정보
	private String people;
	private String selectSit;
	
	// 화면단에서 가져오는 선택메뉴 리스트
	private List<String> resvMenu;
	// 메뉴 리스트 내부의 메뉴와 그 수량, 가격
	private String menuId;
	private String morderQty;
	private String morderPrice;
	
	// 결제여부
	private String payallYn;
	
	// 주문테이블에 넣기한 예약ID리턴
	private String resvId;
	// resvId 기반으로 만든 주문ID
	private String morderId;
	
	// 선결제 관련
	private String mycpnId;
	private String totalPrice;
	
	// PG승인번호
	private String payPg; 
}
