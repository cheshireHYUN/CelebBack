package com.celebback.head.frcheck.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/head/frCheck")
public class FrCheckRetrieveController {

	@GetMapping
	public String frCheckRetrieve() {
		return "head/frCheck/frCheckList";
	}
}
