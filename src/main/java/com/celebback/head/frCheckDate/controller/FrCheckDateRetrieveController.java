package com.celebback.head.frCheckDate.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.celebback.vo.CheckingVO;

@Controller
@RequestMapping("/head/frCheckDate")
public class FrCheckDateRetrieveController {
	@Inject
	com.celebback.head.frcheck.dao.frCheckDAO frCheckDAO;
	@GetMapping
	public String frCheckDateretrieve() {
		return "head/frCheckDate/frCheckDate";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String proccessJsonData(
			Model model
			) {
		List<Map<String, Object>> list = frCheckDAO.selectCalendar();
		model.addAttribute("cal",list);
		
		return  "jsonView";
	}
}
