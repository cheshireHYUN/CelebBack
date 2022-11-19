package com.celebback.vo;

import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import com.celebback.validate.DeleteGroup;
import com.celebback.validate.InsertGroup;
import com.celebback.validate.UpdateGroup;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of= {"cpnId"})
public class CpnVO {
	@NotNull(groups= {UpdateGroup.class, DeleteGroup.class})
	private String cpnId;
	@NotBlank(groups= {InsertGroup.class,UpdateGroup.class})
	private String cpnName;
	@NotBlank(groups= {InsertGroup.class,UpdateGroup.class})
	private String cpnContent;
	@NotBlank(groups= {InsertGroup.class,UpdateGroup.class})
	private String cpnDate;
	@NotBlank(groups= {InsertGroup.class,UpdateGroup.class})
	private String cpnLgu;
	private String tableName;
	@NotBlank(groups= {InsertGroup.class,UpdateGroup.class})
	private String menuId;
	private int rnum;
	private int mycpnId; // Cpn.xml sendCpn keyProperty로 사용
	
	private MultipartFile atchFile;
	
	/**
	 * 마이쿠폰 관련
	 */
	private List<MyCpnVO> myCpn;
	private String[] memIdList;
	
	/**
	 * 파일 첨부 관련
	 */
	private AttatchVO attatch;
	private int startAttatchNo;
}
