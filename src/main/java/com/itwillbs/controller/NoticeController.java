package com.itwillbs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.inject.Inject;
import javax.mail.Session;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.core.io.FileSystemResource;
import javax.mail.internet.MimeMessage;


import java.util.*;




import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.FaqBoardBean;
import com.itwillbs.domain.EmailDTO;
import com.itwillbs.domain.MemberBean;
import com.itwillbs.domain.NoticeBean;
import com.itwillbs.domain.PageBean;
import com.itwillbs.domain.ReviewBean;
import com.itwillbs.service.FaqBoardService;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.NoticeService;
import com.itwillbs.service.NoticeServiceImpl;
import com.mysql.fabric.Response;



@Controller
public class NoticeController {

	@Inject
	private NoticeService noticeService;
	
	@Inject
	private FaqBoardService faqBoardService;
	
	@Inject
	private MemberService memberService;
	
	@Autowired private JavaMailSenderImpl mailSender;

	
	
	
// ------------------------------ ?????? ?????? ?????? ------------------------------
	@RequestMapping(value = "/notice.sh", method = RequestMethod.GET)
	public String NoticeList(HttpServletRequest request,HttpSession session, Model model, MemberBean memberBean) {
//		String member_email = (String)session.getAttribute("member_email");
//		memberBean = memberService.getMember(member_email);
		
//		if(memberBean == null) {
//			model.addAttribute("msg", "????????? ??? ?????????????????????.");
//			return "/dailyShop/service_board/msg";
//		}
		
//		System.out.println("????????? ???"+memberBean);
//		session.setAttribute(member_email, memberBean.getMember_email());
		
		
		List<FaqBoardBean> fbb = faqBoardService.getFaqList();
		model.addAttribute("faqList",fbb);
// -----------------------------------------????????? 10?????? ????????????	
		PageBean pb=new PageBean();
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pb.setPageNum("1");
		}else {
			pb.setPageNum(pageNum);
		}
		int pageSize=10;
		pb.setPageSize(pageSize);
		
		System.out.println("pb??? ?????? pageSize"+pb.getPageSize());
		
		List<NoticeBean> nbList= noticeService.getNoticeList(pb);
		
		//????????? ??????
		
		pb.setCount(noticeService.getnoticeCount());
		
		System.out.println(nbList);
		
		model.addAttribute("nbList",nbList);
		model.addAttribute("pb",pb);
//		model.addAttribute("member",memberBean);
		
		
		
		
		return "/dailyShop/service_board/notice";
		}

// ------------------------------ notice ??????????????? ------------------------------	
	@RequestMapping(value = "/board/contentView.sh", method = RequestMethod.GET)
	public String noticeDetail(@RequestParam("notice_idx") int notice_idx, HttpSession session, Model model, NoticeBean noticeBean) {
		System.out.println(notice_idx);
//		MemberBean memberBean;
		noticeBean = noticeService.getNoticeDatail(notice_idx);
		List<FaqBoardBean> fbb = faqBoardService.getFaqList();
		model.addAttribute("noticeBean", noticeBean);
		model.addAttribute("faqList",fbb);
		return "/dailyShop/service_board/contentViewForm";
	}
	
// ------------------------------ notice ???????????? ------------------------------	
	@RequestMapping(value = "/board/noticelist.sh", method = RequestMethod.GET)
	public String noticeList2(@RequestParam("pageNum") String pageNum, HttpSession session, Model model, NoticeBean noticeBean, HttpServletRequest request) {
		System.out.println("????????????????????? pageNum :"+pageNum);
//		
		PageBean pb=new PageBean();
//		
		if(pageNum==null) {
			pb.setPageNum("1");
		}else {
			pb.setPageNum(pageNum);
		}
		int pageSize=10;
		pb.setPageSize(pageSize);
		
		List<NoticeBean> nbList= noticeService.getNoticeList(pb);
		List<FaqBoardBean> fbb = faqBoardService.getFaqList();
		
		pb.setCount(noticeService.getnoticeCount());
		
		// ----- ????????? pb???  ????????? 
		System.out.println("Startpage:"+pb.getStartPage());
		System.out.println("PageBlock:"+pb.getPageBlock());
		System.out.println("endpage:"+pb.getEndPage());
		
		model.addAttribute("nbList", nbList);
		model.addAttribute("faqList",fbb);
		model.addAttribute("pb",pb);

		return "/dailyShop/service_board/notice";
	}
	

	@RequestMapping(value = "/mailsend.sh", method = RequestMethod.GET)
	public String sendMail(@ModelAttribute EmailDTO dto, MemberBean memberBean,HttpSession session, HttpServletResponse response) throws IOException {
		
		
		String member_email = (String)session.getAttribute("member_email");
		
		memberBean = memberService.getMember(member_email);
		
		int Mailsuccess = noticeService.sendQnaMail(memberBean, dto);
		
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(Mailsuccess == 1) {// mailsuccess ??????????????????
			out.println("<script>alert('1:1?????? ????????????')</script>");
			out.flush();
//			return "/dailyShop/service_board/notice";
			return "/dailyShop/member/index";
		}else {// ??????????????????
			out.println("<script>alert('1:1?????? ???????????? ?????? ???????????? ????????????')</script>");
			out.flush();
			return "/dailyShop/service_board/notice";
		}
	}



}

