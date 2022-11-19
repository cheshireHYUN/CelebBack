package com.celebback.head.frRepair.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/head/frRepair")
public class FrRepairController {
	@GetMapping
	public String frRepairRetrieve() {
		return "head/frRepair/frRepairList";
	}
}
