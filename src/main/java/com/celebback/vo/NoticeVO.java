package com.celebback.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import com.celebback.validate.InsertGroup;
import com.celebback.validate.UpdateGroup;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

/**
 * @author 정아영
 * @since 2022. 8. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                    수정자              수정내용
 * --------       --------    ----------------------
 * 2022. 8. 5.     정아영              최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Data
//@EqualsAndHashCode(of="postNo")
public class NoticeVO {

//	@NotBlank
	private String tableName;
//	@NotBlank
	private String postNo;
	@NotBlank(groups= {InsertGroup.class, UpdateGroup.class})
	@Size(min=1, max=100, groups= {InsertGroup.class, UpdateGroup.class})
	private String postTitle;
	@NotBlank(groups= {InsertGroup.class, UpdateGroup.class})
	private String postContent;
//	@NotBlank
	private String postDate;
	@NotBlank
	private String postWriter;
	@NotBlank(groups= {InsertGroup.class, UpdateGroup.class})
	private String hnRange;
	
	private LguVO lgu;
	
	private int rnum;
	
	private List<AttatchVO> attatchList; //서버
	private int startAttatchNo;
	private int[] delAttNos;
	
	private MultipartFile[] files; //클라이언트
	public void setFiles(MultipartFile[] files) {
		if(files==null || files.length==0) {
			return;
		}
		this.files = files;
		this.attatchList = new ArrayList<>();
		for (MultipartFile file : files) {
			if(file.isEmpty()) {
				continue;
			}
			attatchList.add(new AttatchVO(file));
		}
	}
	
}
