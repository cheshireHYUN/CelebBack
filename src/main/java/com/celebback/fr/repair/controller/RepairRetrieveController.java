package com.celebback.fr.repair.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/fr/repair")
public class RepairRetrieveController {
	@GetMapping
	public String repairRetrieve() {
		return "fr/repair/repairList";
	}
}
