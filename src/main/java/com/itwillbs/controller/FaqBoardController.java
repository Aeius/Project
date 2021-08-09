package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.FaqBoardBean;
import com.itwillbs.domain.MemberBean;
import com.itwillbs.domain.NoticeBean;
import com.itwillbs.domain.PageBean;
import com.itwillbs.service.FaqBoardService;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.NoticeService;

@Controller
public class FaqBoardController {

	@Inject
	private FaqBoardService faqBoardService;
	
	@Inject
	private NoticeService noticeService;
	
	@Inject
	private MemberService memberService;
	
	@Autowired private JavaMailSenderImpl mailSender;
	
//	FAQ 메인 글목록 보기 (완료)
	@RequestMapping (value = "/FAQ", method = RequestMethod.GET)
	public String FaqList(HttpServletRequest request,HttpSession session, Model model, MemberBean memberBean) {
		List<FaqBoardBean> fbb = faqBoardService.getFaqList();
		model.addAttribute("faqList",fbb);
// -----------------------------------------글목록 10개만 불러오기	
		PageBean pb=new PageBean();
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pb.setPageNum("1");
		}else {
			pb.setPageNum(pageNum);
		}
		int pageSize=10;
		pb.setPageSize(pageSize);
		
		System.out.println("pb에 담긴 pageSize"+pb.getPageSize());
		
		List<NoticeBean> nbList= noticeService.getNoticeList(pb);
		
		//전체글 개수
		
		pb.setCount(noticeService.getnoticeCount());
		
		System.out.println(nbList);
		
		model.addAttribute("nbList",nbList);
		model.addAttribute("pb",pb);
		
		return "/dailyShop/service_board/FAQ";
		}
	
//	FAQ 글쓰기 (관리자권한)
	@RequestMapping(value = "/FAQ/insert", method = RequestMethod.GET)
	public String insert() {
		return "/member/insertForm";
	}
	
	
	@RequestMapping (value = "/contact", method = RequestMethod.GET)
	public String contact(HttpServletRequest request,HttpSession session, Model model, MemberBean memberBean) {
		List<FaqBoardBean> fbb = faqBoardService.getFaqList();
		model.addAttribute("faqList",fbb);
// -----------------------------------------글목록 10개만 불러오기	
		PageBean pb=new PageBean();
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pb.setPageNum("1");
		}else {
			pb.setPageNum(pageNum);
		}
		int pageSize=10;
		pb.setPageSize(pageSize);
		
		System.out.println("pb에 담긴 pageSize"+pb.getPageSize());
		
		List<NoticeBean> nbList= noticeService.getNoticeList(pb);
		
		//전체글 개수
		
		pb.setCount(noticeService.getnoticeCount());
		
		System.out.println(nbList);
		
		model.addAttribute("nbList",nbList);
		model.addAttribute("pb",pb);
		return "/dailyShop/service_board/contact";
		}
	
}
