package com.celebback.head.paper.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/head/paper")
public class PaperRetrieveController {

	@GetMapping
	public String paperRetrieve() {
		return "head/paper/paperList";
	}
	
	@GetMapping("/PA001")
	public String paperDetailRetrieve() {
		return "head/paper/paperDetail";
	}
}
