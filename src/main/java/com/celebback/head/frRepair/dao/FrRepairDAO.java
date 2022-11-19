package com.celebback.head.frRepair.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.celebback.vo.BackupVO;

@Mapper
public interface FrRepairDAO {
	/**
	 * 테이블명 전체 조회
	 * @return
	 */
	public List<String> selectTableName();
	
	/**
	 * 테이블 ddl 조회
	 * @param tableNameArr 
	 * @return
	 */
//	public List<Map<String, Object>> selectTableDDL(String[] tableNameArr);
	public BackupVO selectTableDDL(String tableName);
	
	/**
	 * 프로시저 호출 
	 */
	public void plsql();
	
	/**
	 * 테이블 컬럼명 조회
	 * @param tableName
	 * @return
	 */
	public List<String> selectColumnName(String tableName);
	
	/**
	 * 테이블 데이터 조회
	 * @param dataMap
	 * @return
	 */
//	public Map<String, Object> selectData(String tableName);
	public List<Map<String, Object>> selectData(String tableName);
	
	/**
	 * 테이블 기본키 조회
	 * @param tableName
	 * @return
	 */
	public String selectPk(String tableName);
	
	/**
	 * 테이블 외래키 조회
	 * @param tableName
	 * @return
	 */
	public String selectFk(String tableName);
	
	/**
	 * 시퀀스명 조회
	 * @return
	 */
	public List<String> selectSeqName();
	
	/**
	 * 시퀀스 ddl 조회
	 * @param seqName
	 * @return
	 */
	public String selectSeqDDL(String seqName);
	
	/**
	 * 뷰명 조회
	 * @return
	 */
	public List<String> selectViewName();
	
	/**
	 * 뷰 ddl 조회
	 * @param viewName
	 * @return
	 */
	public String selectViewDDL(String viewName);
}
