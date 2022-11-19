package com.celebback.board.notice.controller;

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

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/head/Notice")
public class HeadNoticeFileUploadController {
	@Inject
	private WebApplicationContext context;
	
	private ServletContext application;
	
	@Value("#{appInfo.imageURL}") //EL 혹은 placeholder 사용 가능
	private String imageFolderURL; //저장위치에 대한 URL만 가지고 있지 실제 경로는 아님
	
	private File saveFolder;
	
	//servletContext 꺼내려면 위에 있는 context가 다 주입되고 꺼내야 함.
	@PostConstruct
	public void init() {
		application = context.getServletContext();
		String realPath = application.getRealPath(imageFolderURL); //파일시스템상의 경로
		log.info("*********realPath********* {}", realPath);
		saveFolder = new File(realPath);
		if(!saveFolder.exists()) {
			saveFolder.mkdirs();
		}
		
	}
	
	@PostMapping(value="image", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> imageUpload(@RequestPart MultipartFile upload) throws IOException {
		Map<String, Object> resultMap = new LinkedHashMap<>(); //<프로퍼티이름, 프로퍼티값>
		if(!upload.isEmpty()) {
			String saveName = UUID.randomUUID().toString();
			File saveFile = new File ("/upload/", saveName); //saveFolder에 saveName으로 저장
			upload.transferTo(saveFile); //멀티파트 읽어서 저장
			String imageFileURL =  "/upload/" + saveName;
			//저장한 후에 웹 자원의 패스 잡은거임
			String fileName = upload.getOriginalFilename(); //원본파일명 //getName은 파트이름
			int uploaded = 1;
			resultMap.put("fileName", fileName);
			resultMap.put("uploaded", uploaded);
			resultMap.put("url", imageFileURL);
		} else { //업로드 된 파일이 없다.
			Map<String, Object> error = new HashMap<>();
			error.put("number", 400);
			error.put("message", "업로드 된 파일 없음.");
			resultMap.put("error", error);
		}
		log.info("*****************************{}", resultMap);
		log.info("***********saveFoler********** {}", saveFolder);
		return resultMap;
	}
}
