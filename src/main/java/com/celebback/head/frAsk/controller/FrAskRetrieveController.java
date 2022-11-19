package com.celebback.head.frAsk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/head/frAsk")
public class FrAskRetrieveController {
	@GetMapping
	public String frAskRetrieve() {
		return "head/frAsk/frAskList";
	}
}
