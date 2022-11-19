package com.celebback.board.frNotice.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/fr/frNotice")

public class FrFrNoticeFileUploadController {
	
	@Inject
	private WebApplicationContext context;
	
	private ServletContext application;
	
	@Value("#{appInfo.imageURL}")
	private String imageFolderURL;
	
	private File saveFolder;
	
	@Value("#{appInfo.imagePath}")
	private String imagePath;
	
	@PostConstruct
	public void init() {
		application = context.getServletContext();
		String realPath = application.getRealPath(imageFolderURL);
		saveFolder = new File(realPath);
		if(!saveFolder.exists()) {
			saveFolder.mkdirs();
		}
	}
	
	@PostMapping(value="image", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> imageUpload(@RequestPart MultipartFile upload) throws IOException {
		Map<String, Object> resultMap = new LinkedHashMap<>();
		if(!upload.isEmpty()) {
			String saveName = UUID.randomUUID().toString();
//			File saveFile = new File(saveFolder, saveName);
			File saveFile = new File("/upload/", saveName);
			upload.transferTo(saveFile);
//			String imageFileURL = application.getContextPath() + imageFolderURL + "/" + saveName; //서버사이드 방식 -> cPath 붙여서 클라이언트사이드방식으로 바꿔야 함
			String imageFileURL =  "/upload/" + saveName;
			String fileName = upload.getOriginalFilename();
			int uploaded = 1;
			resultMap.put("fileName", fileName);
			resultMap.put("uploaded", uploaded);
			resultMap.put("url", imageFileURL);
		} else {
			Map<String, Object> error = new HashMap<>();
			error.put("number", 400);
			error.put("message", "업로드 된 파일 없음.");
			resultMap.put("error", error);
		}
		return resultMap;
	}
}