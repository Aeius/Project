package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.NoticeDAO;
import com.itwillbs.domain.EmailDTO;
import com.itwillbs.domain.MemberBean;
import com.itwillbs.domain.NoticeBean;
import com.itwillbs.domain.PageBean;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Inject
	private NoticeDAO noticeDAO;

	@Autowired
	private JavaMailSender mailSender;

	@Override
	public List<NoticeBean> getNoticeList() {
		return noticeDAO.getNoticeList();
	}

	@Override
	public NoticeBean getNoticeDatail(int notice_idx) {
		return noticeDAO.getNoticeDetail(notice_idx);
	}

	
//==================== 작업중(notice list) 
	@Override
	public List<NoticeBean> getNoticeList(PageBean pb) {
		pb.setCurrentPage(Integer.parseInt(pb.getPageNum()));
		pb.setStartRow((pb.getCurrentPage()-1)*pb.getPageSize()+1-1);
		
		return noticeDAO.getNoticeList(pb);
	}
	
	@Override
	public Integer getnoticeCount() {
		System.out.println("여기까진옴");
		return noticeDAO.getNoticeCount();
	}

	@Override
	public int sendQnaMail(MemberBean memberBean, EmailDTO dto) {
		  String tomail = "javateamproject2021@gmail.com";// 받는 사람 이메일
	      String setfrom = dto.getSetfrom(); 
	      System.out.println("dto잘왔나 마지막확인"+dto.getSetfrom());
	      String title = "회원아이디: "+dto.getSetfrom() + dto.getTitle();
	      String content = dto.getContent();
	      int Mailsucess = 0;
	      try {
	         MimeMessage message = mailSender.createMimeMessage();
	         MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

	         messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
	         messageHelper.setTo(tomail); // 받는사람 이메일
	         messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	         messageHelper.setText(content, true); // 메일 내용

	         mailSender.send(message);
	         System.out.println("정상전송");
	         Mailsucess = 1;
	      } catch (Exception e) {
	         System.out.println("메일 발송 실패 - " + e.getMessage());
	      }
	      
	      return Mailsucess;
	   }

	}
	
	//==================== 작업중(mail)

//	@Override
//	public void qnaMail(MemberBean memberBean) {
//		// TODO Auto-generated method stub
//		
//	}
	
	

//	@Override
//	public void sendQnaMail(MemberBean memberBean,HttpServletRequest request) {
//			String setfrom = memberBean.getMember_email(); // 보내는 사람 이메일(회원이메일아이디)
//			System.out.println("setfrom:"+setfrom);
//			String tomail =  "javateamproject2021@gmail.com";
//			String title = request.getParameter("subject");// 제목
//		    String content =  request.getParameter("content");
//		    
//		    try {
//		         MimeMessage message = mailSender.createMimeMessage();
//		         MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
//	
//		         messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
//		         messageHelper.setTo(tomail); // 받는사람 이메일
//		         messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
//		         messageHelper.setText(content, true); // 메일 내용
//	
//		         mailSender.send(message);
//		      } catch (Exception e) {
//		         System.out.println("메일 발송 실패 - " + e.getMessage());
//		      }
//	
//		}
	
