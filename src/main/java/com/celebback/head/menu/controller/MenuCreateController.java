package com.celebback.head.menu.controller;

import java.io.File;
import java.nio.charset.StandardCharsets;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.celebback.head.menu.service.MenuService;
import com.celebback.utils.UploadFileUtils;
import com.celebback.vo.MaterialVO;
import com.celebback.vo.MenuVO;

/**
 * 
 * @author 최서현
 * @since 2022. 8. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2022. 8. 5.       최서현      최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

@Controller
@RequestMapping("/head/menu")
public class MenuCreateController {
	
	private static final Logger logger = LoggerFactory.getLogger(MenuRetrieveController.class);
	
	@Inject 
	private MenuService service;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@GetMapping("/form") 
	public String getMenuForm(MenuVO menu, Model model) throws Exception {
		model.addAttribute("hstock",service.getHStockList());
		return "head/menu/menuForm";
	}
	
	@PostMapping("/form")
	public String postMenuForm(MenuVO menu, MaterialVO material, MultipartFile file, RedirectAttributes rttr) throws Exception {
		
		// form에 등록된 첨부파일(메뉴사진) 정보를 가져오고, 
		// UploadFileUtils을 통해 날짜폴더를 생성한 뒤 원본파일과 썸네일을 모두 저장,
		// 그리고 저장된 경로를 데이터베이스에 insert 하기 위해 MenuVO에 저장해둔다.
		
		String imgUploadPath = uploadPath + File.separator + "attatches";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		   fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);   
		} else {
		   fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}
		menu.setOriginalFilename(file.getOriginalFilename());
		menu.setMenuImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		menu.setMenuThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "thumb" + File.separator + "thumb_" + fileName);
		
		
		service.createMenu(menu,material);
		rttr.addFlashAttribute("msg","success");
		return "redirect:/head/menu";
	}
	
	
}
