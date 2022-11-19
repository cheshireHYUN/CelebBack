package com.celebback.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("FrMenuVO")
public class FrMenuVO {
	
	private String franId;
	private String menuId;
	private String menuName;
	
	private List<String> menuIdList;

}
