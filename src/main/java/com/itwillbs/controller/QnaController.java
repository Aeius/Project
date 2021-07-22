package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.FaqBoardBean;
import com.itwillbs.service.FaqBoardService;

@Controller
public class QnaController {

//	@Inject
//	private FaqBoardService faqBoardService;
	

//	FAQ 글쓰기 (관리자권한)
	@RequestMapping(value = "/QNA", method = RequestMethod.GET)
	public String insert() {
		return "/dailyShop/service_board/contact";
	}
	
}
