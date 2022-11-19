package com.celebback.board.notice.view;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.view.AbstractView;

import com.celebback.vo.AttatchVO;


public class AttatchDownloadView extends AbstractView {

	@Value("#{appInfo['attatchPath']}")
	private File saveFolder;

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse resp) throws Exception {
		
		AttatchVO attatch = (AttatchVO) model.get("attatch");
		String saveName = attatch.getAttatchSavename(); //저장할 때 사용하는 UUID
		File saveFile = new File(saveFolder, saveName); //저장명과 저장위치를 가지고 찾아냄
		if(!saveFile.exists()) {
			resp.sendError(404, "해당 파일은 없음.");
			return;
		}
		// 저장명이 아닌 원본 파일명으로 다운로드
		String fileName = attatch.getAttatchOrgname();
		fileName = URLEncoder.encode(fileName, "UTF-8").replace("+", " ");
		resp.setHeader("Content-Disposition", "attathment;filename=\""+fileName+"\"");
		resp.setContentLengthLong(saveFile.length());
		
		// commons-compress : 폴더를 압축.
//		FileInputStream fis = new FileInputStream(file);
		try(
			OutputStream os = resp.getOutputStream();
		){
			FileUtils.copyFile(saveFile, os);
		}

	}

}
