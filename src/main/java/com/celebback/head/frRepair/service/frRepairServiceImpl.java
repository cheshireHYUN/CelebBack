package com.celebback.head.frRepair.service;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.celebback.head.frRepair.dao.FrRepairDAO;
import com.celebback.vo.BackupVO;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 황단비
 * @since 2022. 9. 2.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자            수정내용
 * --------     --------    ----------------------
 * 2022. 9. 2.       황단비      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Service
@Slf4j
public class frRepairServiceImpl implements frRepairService{
	@Inject
	FrRepairDAO frRepairDAO;

	/**
	 * backup
	 */
	@Override
//	@Scheduled(cron="20 11 18 ? * 2") // 매주 금요일 9시 49분 0초에 실행
//	@Scheduled(cron="0 0 0 L * ?") // 매달 마지막 날 자정에 실행
	public void backupProcess() {
		// DAO1. 테이블명
		// DAO2. 테이블DDL
		// DAO3. INSERT 쿼리 만들기
		// DAO4. 기본키
		// DAO5. 외래키
		// DAO6. 시퀀스
		// DAO6. 뷰

		// DAO1. 테이블명
		List<String> tableNames = frRepairDAO.selectTableName();
		frRepairDAO.plsql();
		
		// DAO2. 테이블DDL
		List<BackupVO> result = new ArrayList<>();

		for(int i=0; i<tableNames.size(); i++) {
			result.add(frRepairDAO.selectTableDDL(tableNames.get(i)));
		}

		// DAO3. INSERT 쿼리 만들기
		// DAO4. 기본키
		// DAO5. 외래키
		List<String> columnNames = new ArrayList<>();
		List<List<Map<String, Object>>> dataMap = new ArrayList<>();
		List<String> insertSql = new ArrayList<>();
		List<String> pkfkList = new ArrayList<>();
		int realIndex=0;
		for(int i=0; i<tableNames.size(); i++) {
			String tableName = frRepairDAO.selectPk(tableNames.get(i));
			if(tableName != null) {
				pkfkList.add(tableName);
			}
			if(tableName != null) {
				pkfkList.add(tableName);
			}
			
			columnNames=frRepairDAO.selectColumnName(tableNames.get(i)); // 컬럼명 담기
			List<Map<String, Object>> columnName = frRepairDAO.selectData(tableNames.get(i));
			if(!columnName.isEmpty() ) {
				dataMap.add(columnName); // 데이터 담기
				String columnSql = "";
				for(int m=0; m<columnNames.size();m++) {
					if(m==0) {
						columnSql += columnNames.get(m);
					}else {
						columnSql += " ,"+ columnNames.get(m);
					}
				}
				
				for(int n=0; n<dataMap.get(realIndex).size();n++) {
					String dataSql = "";
					for(int m=0; m<dataMap.get(realIndex).get(n).size();m++) {
					if(m==0) {
						if(dataMap.get(realIndex).get(n).get(columnNames.get(m)) != null) {
							dataSql += "\""+dataMap.get(realIndex).get(n).get(columnNames.get(m))+"\"";
						}else {
							dataSql += dataMap.get(realIndex).get(n).get(columnNames.get(m));
						}
					}else {
						if(dataMap.get(realIndex).get(n).get(columnNames.get(m)) != null) {
							dataSql += " ,\""+dataMap.get(realIndex).get(n).get(columnNames.get(m))+"\"";
						}
						else {
							dataSql += " ,"+dataMap.get(realIndex).get(n).get(columnNames.get(m));
						}
						
					}
				}
				
				insertSql.add("INSERT INTO "+tableNames.get(i)+" ("+columnSql +")"
							+" VALUES (" + dataSql + ");"
						);
			}
				realIndex++;
		}
//			else {
//		}
		}
		

		// DAO6. 시퀀스
		List<String> seqNames = frRepairDAO.selectSeqName();
		List<String> seqDDL = new ArrayList<>();
		
		for(int i=0; i<seqNames.size();i++) {
			seqDDL.add(frRepairDAO.selectSeqDDL(seqNames.get(i)));
		}
		
		// DAO7. 뷰
		List<String> viewNames = frRepairDAO.selectViewName();
		List<String> viewDDL = new ArrayList<>();
		
		for(int i=0; i<viewNames.size();i++) {
			viewDDL.add(frRepairDAO.selectViewDDL(viewNames.get(i)));
		}
		
		// 경로가 없다면 만들어주기
		File dir = new File("d:/contents/");
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		PrintWriter oos = null;
			
			try {
				oos = new PrintWriter(
							new FileOutputStream("d:/contents/backup.sql"));

				//OutputStreamWriter osw1 = new OutputStreamWriter(oos, "UTF-8");
				for(int i=0; i<result.size();i++) {
					oos.write(result.get(i).getTableDdl());
//					oos.writeUTF((result.get(i).getTableDdl()));
//					oos.writeChars(a.get(i));
				}
				for(int i=0; i<insertSql.size(); i++) {
					oos.write(insertSql.get(i)+"\n");
				}
				for(int i=0; i<pkfkList.size(); i++) {
					oos.write(pkfkList.get(i)+"\n");
				}
				for(int i=0; i<seqDDL.size(); i++) {
					oos.write(seqDDL.get(i)+"\n");
				}
				for(int i=0; i<viewDDL.size(); i++) {
					oos.write(viewDDL.get(i)+"\n");
				}
				
				
				oos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

	}

}
