package com.itwillbs.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class PayController {

	@RequestMapping(value = "/naverPay.sh", method = RequestMethod.GET)
	public String naverPay() {
		return "/dailyShop/member/naverPay";
	}
}
