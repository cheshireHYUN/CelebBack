package com.celebback.vo;

import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import com.celebback.validate.InsertGroup;

import lombok.Data;
import lombok.EqualsAndHashCode;
/**
 * 
 * @author 황단비
 * @since 2022. 8. 9.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자            수정내용
 * --------     --------    ----------------------
 * 2022. 8. 9.       황단비      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Data
@EqualsAndHashCode(of= {"checkDate","franId"})
public class CheckingVO {
	@NotBlank(message="javax.validation.constraints.NotBlank.message",groups= {InsertGroup.class})
	private String checkDate;
	private String franId;
	private String franName;
	private String state;
	private Integer rnum;
	@NotNull(groups= {InsertGroup.class})
	private Integer checkIndi;
	@NotNull(groups= {InsertGroup.class})
	private Integer checkFran;
	@NotNull(groups= {InsertGroup.class})
	private Integer checkFood;
	private Integer totalScore;
	public List<ChkFailVO> chkFail;
	
	private String eduSn;
}