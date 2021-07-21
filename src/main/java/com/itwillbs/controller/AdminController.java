package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
	
	
	// 실행되는지 보려고 대충 넣어놓은 것
	
	@RequestMapping(value = "/subList", method = RequestMethod.GET)
	public String subList() {
		
		return "/AdminLTE-master/pages/subscriberList";
	}
	
	@RequestMapping(value = "/chart", method = RequestMethod.GET)
	public String chart() {
		
		return "/AdminLTE-master/pages/chart";
	}
	
	@RequestMapping(value = "/faqWrite", method = RequestMethod.GET)
	public String faqWrite() {
		
		return "/AdminLTE-master/pages/faqWrite";
	}
}
