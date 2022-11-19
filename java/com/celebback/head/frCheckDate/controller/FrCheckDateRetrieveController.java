package com.celebback.head.frCheckDate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/head/frCheckDate")
public class FrCheckDateRetrieveController {
	@GetMapping
	public String frCheckDateretrieve() {
		return "head/frCheckDate/frCheckDate";
	}
}
