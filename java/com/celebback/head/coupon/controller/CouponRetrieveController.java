package com.celebback.head.coupon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/head/coupon")
public class CouponRetrieveController {
	@GetMapping
	public String couponRetrieve() {
		return "head/coupon/couponList";
	}
}
