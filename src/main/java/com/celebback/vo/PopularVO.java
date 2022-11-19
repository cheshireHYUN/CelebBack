package com.celebback.vo;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("PopularVO")
public class PopularVO {
	
	// 검색조건
	private String franId;
	private String stDate;
	private String enDate;
	
	//찜 갯수
	private int wishCnt;
	private int wishCntMonth;
	
	// 리뷰누적갯수
	private int reviewCnt;
	private int reviewCntMonth;
	
	// 메뉴별 판매량
	private String menuName;
	private int sumQty;
	Map<String, Integer> menuMap;
	List<String> menuThumbList;
	private String thumbImg;
	
	// 전체 방문인원(일별)
	private String morderDate;
	private String allPcnt;
	List<String> allPcntList;
	
	// 예약 방문 인원(일별)
	private String resvDate;
	private String resvPcnt;
	List<String> resvPcntList;
	
	// 차트를 위한 방문인원 데이터리스트
	List<String> allDateList; //해당 달이 총 몇일?
	List<String> resvCntList; // 해당달의 일별 예약자수
	List<String> allCntList; // 해당달의 일별 방문수
	
	
	

}
