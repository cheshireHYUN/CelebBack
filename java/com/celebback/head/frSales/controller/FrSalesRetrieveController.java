package com.celebback.head.frSales.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/head/frSales")
public class FrSalesRetrieveController {
	
	@GetMapping
	public String frSalesretrieve() {
		return "head/frSales/frSales";
	}
}
