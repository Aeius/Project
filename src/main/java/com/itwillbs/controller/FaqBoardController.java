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
public class FaqBoardController {

	@Inject
	private FaqBoardService faqBoardService;
	
//	FAQ 메인 글목록 보기 (완료)
	@RequestMapping (value = "/FAQ", method = RequestMethod.GET)
	public String FaqList(HttpSession session, Model model) {
		List<FaqBoardBean> fbb = faqBoardService.getFaqList();
		model.addAttribute("faqList",fbb);
		return "/dailyShop/service_board/FAQ";
		}
	
//	FAQ 글쓰기 (관리자권한)
	@RequestMapping(value = "/FAQ/insert", method = RequestMethod.GET)
	public String insert() {
		return "/member/insertForm";
	}
	
}
