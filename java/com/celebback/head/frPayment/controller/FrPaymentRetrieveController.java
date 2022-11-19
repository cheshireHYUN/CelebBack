package com.celebback.head.frPayment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/head/frPayment")
public class FrPaymentRetrieveController {
	
	@GetMapping
	public String frPaymentRetrieve() {
		return "head/frPayment/frPayment";
	}
}
