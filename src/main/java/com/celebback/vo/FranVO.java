package com.celebback.vo;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

//import com.celebback.batch.stereotypes.FieldSet;

import lombok.Data;

@Data
//@FieldSet({
//	"franId"
//	,"ownerId"
//	,"franLoca"
//	,"franName"
//	,"franTel"
//	,"franBank"
//	,"franAccount"
//	,"franStdate"
//	,"franEndate"
//	,"franState"
//	,"franZip"
//	,"franAdd1"
//	,"franAdd2"
//	,"franSttime"
//	,"franEntime"
//	,"franXmap"
//	,"franCdate"
//	,"franInsdate"
//	,"franInedate"
//	,"franOpdate"
//	,"franBsttime"
//	,"franBentime"
//	,"score"
//	,"franYmap"
//})
//@XmlRootElement(name="fran")
//@XmlAccessorType(XmlAccessType.PROPERTY)
public class FranVO implements Serializable{
	private String franId;
	private String ownerId;
	private String franLoca;
	private String franName;
	private String franTel;
	private String franBank;
	private String franAccount;
	private String franStdate; // 가맹등록일자
	private String franEndate; // 계약만료일자
	private String franState;
	private String franZip;
	private String franAdd1;
	private String franAdd2;
	private String franSttime;
	private String franEntime;
	private Float franXmap;
	private String franCdate;
	private String franInsdate; // 인테리어시작일자
	private String franInedate; // 인테리어종료일자
	private String franOpdate; // 개점예정일
	private String franBsttime;
	private String franBentime;
	private String score;
	private Float franYmap;
	private CheckingVO checking;
	private OwnerVO owner;
	private LguVO lgu;
	
	// 일반회원에서 필요...
	private int franSttimeInt;
	private int franEntimeInt;
	private int franBsttimeInt;
	private int franBentimeInt;

	
	// 매장리스트에 별점에 필요
	private int starAvg;
	private String star;
	
}
