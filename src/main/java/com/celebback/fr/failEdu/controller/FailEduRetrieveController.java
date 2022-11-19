package com.celebback.fr.failEdu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/fr/failEdu")
public class FailEduRetrieveController {
	@GetMapping
	public String FailEduRetrieve() {
		return "fr/failEdu/failEduList";
	}
}
