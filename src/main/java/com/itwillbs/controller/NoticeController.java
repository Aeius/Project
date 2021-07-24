package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.FaqBoardBean;
import com.itwillbs.domain.NoticeBean;
import com.itwillbs.service.FaqBoardService;
import com.itwillbs.service.NoticeService;
import com.itwillbs.service.NoticeServiceImpl;

@Controller
public class NoticeController {

	@Inject
	private NoticeService noticeService;
	
	
	@RequestMapping(value = "/notice.sh", method = RequestMethod.GET)
	public String NoticeList(HttpSession session, Model model) {
		
//		member전체의 정보를 조회 (리턴값 List배열 MemberBean형으로 정의)
		List<NoticeBean> nb = noticeService.getNoticeList();
		model.addAttribute("NoticeList", nb);
		return "/dailyShop/service_board/notice";
		}
}
