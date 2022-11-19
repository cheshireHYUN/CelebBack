package com.celebback.head.fr.service;

import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.el.ELContext;
import javax.inject.Inject;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.celebback.head.fr.dao.FrDAO;
import com.celebback.vo.ApplyVO;
import com.celebback.vo.ConsultVO;
import com.celebback.vo.FranVO;
import com.celebback.vo.OwnerVO;
import com.celebback.vo.PagingVO;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 황단비
 * @since 2022. 8. 4.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 *  수정일       수정자            수정내용
 * --------     --------    ----------------------
 * 2022. 8. 4.       황단비      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
@Service
@Slf4j
public class FrServiceImpl implements FrService{
	@Inject
	FrDAO frDAO;
	
	/**
	 * 가맹점 전체 조회
	 */
	@Override
	public List<FranVO> retrieveFranList(PagingVO<FranVO> pagingVO) {
		pagingVO.setTotalRecord(frDAO.selectTotalRecord(pagingVO));
		List<FranVO> franList = frDAO.selectFranList(pagingVO);
		pagingVO.setDataList(franList);
		return franList;
	}

	/**
	 * 가맹점 상세 조회
	 */
	@Override
	public FranVO retrieveFran(String franId) {
		return frDAO.selectFran(franId);
	}

	/**
	 * 엑셀 파일로 가맹점 정보 수정
	 * @throws IOException 
	 */
	@Override
	@Transactional
	public void excelUpload(MultipartHttpServletRequest request) throws IOException {
		int successCnt = 0;
		int failCnt = 0;
		
		MultipartFile file = request.getFile("excelUp");
		HashMap map = new HashMap();
		
		// 각각 다른 쿼리로 연결
		ConsultVO consultVO = null;
		ApplyVO applyVO = null;
		OwnerVO ownerVO = null;
		FranVO franVO=null;
		
		if(file != null && !file.isEmpty()) {
			
			InputStream is = file.getInputStream();
			Workbook workbook = WorkbookFactory.create(is);
			Sheet sheet = workbook.getSheetAt(0);
			int rowCnt = sheet.getPhysicalNumberOfRows();
			
			for(int i=1; i<rowCnt; i++) {
				Row row = sheet.getRow(i);
				
					if(row == null){
						continue;
					}else{
						int cellCnt = row.getPhysicalNumberOfCells();
						
						String value = "";
						
						consultVO = new ConsultVO();
						applyVO = new ApplyVO();
						ownerVO = new OwnerVO();
						franVO = new FranVO();
						
						for(int j=0; j<cellCnt; j++) {
							value = "";
							Cell cell = row.getCell(j);
							if( cell != null ) {
								if (cell.getCellType() == CellType.STRING){
									value = cell.getStringCellValue();
								}else if(cell.getCellType() == CellType.NUMERIC) {
									if( DateUtil.isCellDateFormatted(cell)) {
										Date date = cell.getDateCellValue();
										value = new SimpleDateFormat("yyyy-MM-dd").format(date);
									}
									else
										value = String.valueOf(cell.getNumericCellValue());
								}
							}
							switch(j){
								case 0 : franVO.setFranId(value); break;
								case 1 : ownerVO.setOwnerId(value);
										 franVO.setOwnerId(value); break;
								case 2 : ownerVO.setOwnerName(value);
										 consultVO.setConsultName(value); break;
								case 3 : ownerVO.setOwnerTel(value);
									     consultVO.setConsultTel(value); break;
								case 4 : ownerVO.setOwnerBirth(value); break;
								case 5 : ownerVO.setOwnerPedu(value); break;
								case 6 : consultVO.setConsultSn(value);
										 applyVO.setConsultSn(value);
										 ownerVO.setConsultSn(value); break;
								case 7 : franVO.setFranName(value); break;
								case 8 : franVO.setFranTel(value); break;
								case 9 : franVO.setFranBank(value); break;
								case 10: franVO.setFranAccount(value); break;
								case 11: franVO.setFranState(value); break;
								case 12: franVO.setFranEndate(value); break;
								case 13: franVO.setFranInsdate(value); break;
								case 14: franVO.setFranInedate(value); break;
								case 15: applyVO.setApplyZip(value.substring(0,5)); break;
								case 16: consultVO.setConsultDate(value); break;
								case 17: //consultVO.setConsultTime(value);
										break;
								case 18: applyVO.setApplyAdd1(value); break;
								case 19: applyVO.setApplyAdd2(value); break;
								case 20: ownerVO.setOwnerAdd1(value); break;
								case 21: ownerVO.setOwnerAdd2(value); break;
								case 22: franVO.setFranLoca(value.substring(0,2)); break;
								case 23: franVO.setFranZip(value.substring(0,5)); break;
								case 24: franVO.setFranAdd1(value); break;
								case 25: franVO.setFranAdd2(value); break;
								case 26: franVO.setFranXmap(Float.parseFloat(value) );
								case 27: franVO.setFranYmap(Float.parseFloat(value) );
								default : break;
							}
						} // 한 줄 읽음.
						
						// 한줄한줄 insert or update 치기
						frDAO.mergeConsult(consultVO);
						frDAO.mergeApply(applyVO);
						frDAO.mergeOwner(ownerVO);
						frDAO.mergeFran(franVO);
					}
				}
			}
			
//			map.put("boardVO",excleVO);
//			map.put("successCnt",successCnt);
//			map.put("failCnt",failCnt);
		
		/*
		 * 1. excelVO 셀 하나 읽고 savedVO랑 비교
		 * 방법1) 가맹점 하나하나 셀렉트해와서 비교 (장점:엑셀파일의 가맹점 순서가 달라도 오류없음 / 
		 * 											 단점: 등록된 가맹점이 많으면 쿼리를 너무 많이 불러올거같음)
		 * 	  excelVO 첫번째 셀: 가맹점 id (a001)
		 * 	  a001 가맹점 셀렉트해서 savedVO에 담기
		 *    excelVO와 savedVO 비교해서 update 처리
		 * 
		 * 방법2) 리스트로 받아서 비교하기 (장점: 가맹점 조회 쿼리를 한번만 불러옴
		 * 									단점: 엑셀파일의 가맹점 순서가 다를 때 혼란 발생...)
		 * 	  엑셀파일의 가맹점 순서가 같다고 가정하고, 
		 * 	  savedVO를 가맹점을 전체 조회한 리스트로 받아서   
				1-1. 바뀐 부분 있음
					1-1-1. OWNER쪽 정보에 변경이 있음
						OWNER 우선 UPDATE
						fran UPDATE
					1-1-2. FRAN만 변경
						fran  UPDATE
				1-2. 바뀐 부분 없음 PASS
		 * 
		 */
		
	}

	/**
	 * 가맹점 정보 엑셀 다운로드
	 */
	@Override
	public void excelDownload(HttpServletResponse res) {
		ServletOutputStream sos = null;
		try {
			//목록리스트
			List<?> excelList = frDAO.excelDown();
			
			//엑셀 생성
			Workbook xlsWb = new HSSFWorkbook();
			//시트 생성
			Sheet sheet1 = (Sheet) xlsWb.createSheet("가맹점 목록");

			//셀 스타일 설정
			CellStyle style = xlsWb.createCellStyle();
			style.setWrapText(true);
			style.setFillForegroundColor(IndexedColors.LIGHT_CORNFLOWER_BLUE.index);
			style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
			style.setAlignment(HorizontalAlignment.CENTER);
			style.setVerticalAlignment(VerticalAlignment.CENTER);
			style.setBorderRight(BorderStyle.THIN);
			style.setBorderBottom(BorderStyle.THIN);
			style.setBorderLeft(BorderStyle.THIN);
			style.setBorderTop(BorderStyle.THIN);
			
			Font font = xlsWb.createFont();
			font.setFontHeightInPoints((short) 11);
			style.setFont(font);

			CellStyle csCell = xlsWb.createCellStyle();
			csCell.setWrapText(true);
			csCell.setAlignment(HorizontalAlignment.CENTER);
			csCell.setVerticalAlignment(VerticalAlignment.CENTER);
			
			//시트  로우 생성용
			Row row = null;
			
			// 시트  셀 생성용
			Cell cell = null;
			int rowNum = 0;
			int i = 0;
			int j = 0;
			int x = 0;
			int z = 0;
			
			
			int n=1;
			int index=0;
			// 컬럼 한글명
			// 합친 행 부분도 빈칸으로 만들어준다
			String[] title = {"가맹점ID", "가맹점주ID", "가맹점주명", "가맹점주전화번호", "생년월일", "사전교육이수여부", "신청자일련번호", "가맹점지역코드", "가맹점명", "가맹점전화번호", "은행명", "계좌번호", "우편번호", "주소1", "주소2", "운영상태", "가맹등록일자", "계약만료일자", "계약체결일자", "인테리어시작일자", "인테리어종료일자", "개점일", "지도상X좌표", "지도상Y좌표"};
			int size = 512; // 시트별 사이즈 설정 계산용
			// 시트별 사이즈 설정
			int[] widthSize = {1,1,1,1,1,1,1,1,1,1,
							   1,1,1,1,1,1,1,1,1,1,
							   1,1,1,1             };
			
			row = sheet1.createRow(rowNum++); // Title - row 생성
			row.setHeight((short)size);
			row.setHeightInPoints((2*sheet1.getDefaultRowHeightInPoints()));
			
			// 셀 스타일 적용
			for( i = 0; i < title.length; i++ ) {
				cell = row.createCell(i);
				cell.setCellValue(title[i]);
				cell.setCellStyle(style);
				sheet1.autoSizeColumn(i);
				sheet1.setColumnWidth(i, (short)(sheet1.getColumnWidth(i) + (size * widthSize[i])));
				
			}
			
			if(excelList != null && excelList.size() > 0 ) {
				
				FranVO vo = null;
				int excelListLen = excelList.size();
				
				for( i = 0; i < excelListLen; i++, rowNum++ ) {
					
					String corListRslt="";
					vo = (FranVO) excelList.get(i);
					j = 0;
					row = sheet1.createRow(n);
//					cell = row.createCell(j++);
//					cell.setCellValue(index); //순번
//					cell.setCellStyle(csCell);
//					sheet1.addMergedRegion(new CellRangeAddress(n, n+5, 0, 0));
					
					cell = row.createCell(j++);
					cell.setCellValue(vo.getFranId()); // 가맹점id
					cell.setCellStyle(csCell);
					sheet1.addMergedRegion(new CellRangeAddress(n, n+5, 0, 0));
					
					cell = row.createCell(j++);
					cell.setCellValue(vo.getOwnerId());
					cell.setCellStyle(csCell);
					sheet1.addMergedRegion(new CellRangeAddress(n, n+5, 1, 1));
					
					cell = row.createCell(j++);
					cell.setCellValue(vo.getOwner().getOwnerName());
					cell.setCellStyle(csCell);
					sheet1.addMergedRegion(new CellRangeAddress(n, n+5, 2, 2));
					
					cell = row.createCell(j++);
					cell.setCellValue(vo.getOwner().getOwnerTel());
					cell.setCellStyle(csCell);
					sheet1.addMergedRegion(new CellRangeAddress(n, n+5, 3, 3));
					
					cell = row.createCell(j++);
					cell.setCellValue(vo.getOwner().getOwnerBirth());
					cell.setCellStyle(csCell);
					sheet1.addMergedRegion(new CellRangeAddress(n, n+5, 4, 4));
					
					cell = row.createCell(j++);
					cell.setCellValue(vo.getOwner().getOwnerPedu());
					cell.setCellStyle(csCell);
					sheet1.addMergedRegion(new CellRangeAddress(n, n+5, 5, 5));
					
					cell = row.createCell(j++);
					cell.setCellValue(vo.getOwner().getConsultSn());
					cell.setCellStyle(csCell);
					sheet1.addMergedRegion(new CellRangeAddress(n, n+5, 6, 6));
					
					cell = row.createCell(j++);
					cell.setCellValue(vo.getFranState());
					cell.setCellStyle(csCell);
					sheet1.addMergedRegion(new CellRangeAddress(n, n+5, 7, 7));
					
					cell = row.createCell(j++);
					cell.setCellValue(vo.getFranName());
					cell.setCellStyle(csCell);
					sheet1.addMergedRegion(new CellRangeAddress(n, n+5, 8, 8));
					
					cell = row.createCell(j++);
					cell.setCellValue(vo.getFranTel());
					cell.setCellStyle(csCell);
					sheet1.addMergedRegion(new CellRangeAddress(n, n+5, 9, 9));
					
					cell = row.createCell(j++);
					cell.setCellValue(vo.getFranBank());
					cell.setCellStyle(csCell);
					sheet1.addMergedRegion(new CellRangeAddress(n, n+5, 10, 10));
					
					cell = row.createCell(j++);
					cell.setCellValue(vo.getFranAccount());
					cell.setCellStyle(csCell);
					sheet1.addMergedRegion(new CellRangeAddress(n, n+5, 11, 11));
					
					cell = row.createCell(j++);
					cell.setCellValue(vo.getFranZip());
					cell.setCellStyle(csCell);
					sheet1.addMergedRegion(new CellRangeAddress(n, n+5, 12, 12));
					
					cell = row.createCell(j++);
					cell.setCellValue(vo.getFranAdd1());
					cell.setCellStyle(csCell);
					sheet1.addMergedRegion(new CellRangeAddress(n, n+5, 13, 13));
					
					cell = row.createCell(j++);
					cell.setCellValue(vo.getFranAdd2());
					cell.setCellStyle(csCell);
					sheet1.addMergedRegion(new CellRangeAddress(n, n+5, 14, 14));
					
					cell = row.createCell(j++);
					cell.setCellValue(vo.getFranState()); 
					cell.setCellStyle(csCell);
					sheet1.addMergedRegion(new CellRangeAddress(n, n+5, 15, 15));
					
					cell = row.createCell(j++);
					cell.setCellValue(vo.getFranStdate());//가맹등록일자
					cell.setCellStyle(csCell);
					sheet1.addMergedRegion(new CellRangeAddress(n, n+5, 16, 16));
					
					cell = row.createCell(j++);
					cell.setCellValue(vo.getFranEndate()); // 계약만료일자
					cell.setCellStyle(csCell);
					sheet1.addMergedRegion(new CellRangeAddress(n, n+5, 17, 17));
					
					cell = row.createCell(j++);
					cell.setCellValue(vo.getFranCdate()); // 계약체결일자
					cell.setCellStyle(csCell);
					sheet1.addMergedRegion(new CellRangeAddress(n, n+5, 18, 18));
					
					cell = row.createCell(j++);
					cell.setCellValue(vo.getFranInsdate()); //인테리어시작일자
					cell.setCellStyle(csCell);
					sheet1.addMergedRegion(new CellRangeAddress(n, n+5, 19, 19));
					
					cell = row.createCell(j++);
					cell.setCellValue(vo.getFranInedate()); // 인테리어종료일자
					cell.setCellStyle(csCell);
					sheet1.addMergedRegion(new CellRangeAddress(n, n+5, 20, 20));
					
					cell = row.createCell(j++);
					cell.setCellValue(vo.getFranOpdate()); // 개점일
					cell.setCellStyle(csCell);
					sheet1.addMergedRegion(new CellRangeAddress(n, n+5, 21, 21));
					
					cell = row.createCell(j++);
					cell.setCellValue(vo.getFranXmap());
					cell.setCellStyle(csCell);
					sheet1.addMergedRegion(new CellRangeAddress(n, n+5, 22, 22));
					
					cell = row.createCell(j++);
					cell.setCellValue(vo.getFranYmap());
					cell.setCellStyle(csCell);
					sheet1.addMergedRegion(new CellRangeAddress(n, n+5, 23, 23));
					
					
					n += 6;
					index=0;

				}
				
			}
			res.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode("가맹점_전체_정보_엑셀파일.xls", "UTF-8"));
			res.setContentType("application/vnd.ms.excel");
			sos = res.getOutputStream();
			xlsWb.write(sos);
			xlsWb.close();
			sos.flush();
			
		} catch (Exception e) {
			e.printStackTrace();
			log.info("엑셀다운로드 실패!!!!!!!!!!!!!!!!!!!!!!!");
		}finally {
			if(sos != null)
				try {
					sos.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
	}

	
}
