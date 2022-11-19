package com.celebback.vo;

import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import com.celebback.validate.DeleteGroup;
import com.celebback.validate.InsertGroup;
import com.celebback.validate.UpdateGroup;

import lombok.Data;
/**
 * 
 * @author 황단비
 * @since 2022. 8. 18.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자            수정내용
 * --------     --------    ----------------------
 * 2022. 8. 18.       황단비      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Data
public class PaperVO {
	@NotNull(groups= {UpdateGroup.class, DeleteGroup.class})// update,delete
	private String paperId;
	private String franId;
	private String tableName;
	@NotBlank(groups= {InsertGroup.class,UpdateGroup.class})
	private String paperName;
	@NotBlank(groups= {InsertGroup.class,UpdateGroup.class})
	private String paperContent;
	private int rnum;
	private String[] ownerIdList;
	private List<FrPaperVO> frPaper;
	
	private MultipartFile atchFile;
	
	private int paperSn; // Paper.xml sendPaper keyProperty로 사용
	
	private AttatchVO attatch;
	private int startAttatchNo;
	
	private String authName;
}
