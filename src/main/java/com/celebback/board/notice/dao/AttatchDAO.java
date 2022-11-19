package com.celebback.board.notice.dao;

import org.apache.ibatis.annotations.Mapper;

import com.celebback.vo.AttatchVO;
import com.celebback.vo.NoticeVO;

@Mapper
public interface AttatchDAO {
	public int insertAttatches(NoticeVO notice);
	
	public AttatchVO selectAttatch(int attatchNo);
	
	public int deleteAttatch(int attatchNo);
	
	public int deleteAttatches(NoticeVO notice);
	
	public AttatchVO selectAttatchPK(String tablePk);
}
