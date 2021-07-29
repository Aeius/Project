package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.FaqBoardBean;
import com.itwillbs.domain.MemberBean;
import com.itwillbs.domain.NoticeBean;
import com.itwillbs.domain.PageBean;
import com.itwillbs.domain.ReviewBean;
import com.itwillbs.service.FaqBoardService;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.NoticeService;
import com.itwillbs.service.NoticeServiceImpl;

@Controller
public class NoticeController {

	@Inject
	private NoticeService noticeService;
	
	@Inject
	private FaqBoardService faqBoardService;
	
	@Inject
	private MemberService memberService;
	
	
	
// ------------------------------ 상단 메뉴 모음 ------------------------------
	@RequestMapping(value = "/notice.sh", method = RequestMethod.GET)
	public String NoticeList(HttpServletRequest request,HttpSession session, Model model, MemberBean memberBean) {
		
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
		
		return "/dailyShop/service_board/notice";
		}

// ------------------------------ notice 게시글보기 ------------------------------	
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
	
// ------------------------------ notice 목록변경 ------------------------------	
	@RequestMapping(value = "/board/noticelist.sh", method = RequestMethod.GET)
	public String noticeList2(@RequestParam("pageNum") String pageNum, HttpSession session, Model model, NoticeBean noticeBean, HttpServletRequest request) {
		System.out.println("목록번호나와라 pageNum :"+pageNum);
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
		
		// ----- 가져온 pb값  확인중 
		System.out.println("Startpage:"+pb.getStartPage());
		System.out.println("PageBlock:"+pb.getPageBlock());
		System.out.println("endpage:"+pb.getEndPage());
		
		model.addAttribute("nbList", nbList);
		model.addAttribute("faqList",fbb);
		model.addAttribute("pb",pb);

		return "/dailyShop/service_board/notice";
	}
// ------------------------------ notice 목록연결 ------------------------------		
//	@RequestMapping(value = "/notice.list", method = RequestMethod.GET)
//	public String list(HttpServletRequest request,Model model) {
//		PageBean pb=new PageBean();
//		String pageNum=request.getParameter("pageNum");
//		if(pageNum==null) {
//			pb.setPageNum("1");
//		}else {
//			pb.setPageNum(pageNum);
//		}
//		int pageSize=15;
//		pb.setPageSize(pageSize);
//		
//		List<NoticeBean> nbList= noticeService.getNoticeList(pb);
//		
//		//전체글 개수
//		
//		
//		model.addAttribute("nbList",nbList);
//		model.addAttribute("pb",pb);
//		//  /WEB-INF/views/center/notice.jsp 이동
//		return "/dailyShop/service_board/notice";
//	}
// ------------------------------ qna 메일보내기 ------------------------------
	
//	@RequestMapping(value = "/contact/mailsend", method = RequestMethod.POST)
//	public String qnaMail(@PathVariable String member_email,HttpServletRequest request) {
//		MemberBean memberBean = memberService.getMember(member_email);
//		noticeService.sendQnaMail(memberBean,request);
//		return "redirect:/main.sh";
//	}
	
//	http://localhost:8080/myweb2/board/content?num=${notice_idx}

	


}