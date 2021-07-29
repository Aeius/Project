package com.itwillbs.service;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.CouponBean;
import com.itwillbs.domain.MemberBean;

@Service
public class MemberServiceImpl implements MemberService {
   
   // xml에서 객체생성한것을 set 메서드를 통해서 부모인터페이스 멤버변수에 객체 생성한 것을 자동으로 전달 받기(Inject 사용)
   @Inject
   private MemberDAO memberDAO;
   
   // 메일 api 사용을 위한 멤버 변수 선언
   @Autowired
   private JavaMailSender mailSender;
   
   @Override
   public boolean insertMember(MemberBean mb) {
      boolean isRegisted = false;
      // 날짜 처리
      mb.setMember_date(new Date(System.currentTimeMillis()));
      // MemberDAOImpl 메서드 호출
      
      // MemberDAOImpl 메서드 호출
      int insertCount = memberDAO.insertMember(mb);
      if(insertCount > 0) {
         isRegisted = true;
      }
      return isRegisted;
   }

   @Override
   public MemberBean userCheck(MemberBean memberBean) {
      System.out.println("userCheck");
      return memberDAO.userCheck(memberBean);
   }

   @Override
   public MemberBean getMember(String id) {
      System.out.println("getMember");
      
      return memberDAO.getMember(id);
   }

   @Override
   public void updateMember(MemberBean memberBean) {
      System.out.println("MemberService - updateMember");
      memberDAO.updateMember(memberBean);
   }
   
   @Override
   public void deleteMember(MemberBean memberBean) {
      System.out.println("MemberService - deleteMember");
      memberDAO.deleteMember(memberBean);
   }
   
	@Override
	public List<MemberBean> getMemberList() {
		System.out.println("MemberService - getMemberList()");
		return memberDAO.getMemberList();
	}

   @Override
   public String emailCheck(MemberBean mb) {
      //
      System.out.println("userCheck");
      return memberDAO.emailCheck(mb);
   }

   @Override
   public ArrayList<CouponBean> getMemberCouponList(String member_email) {
      String memberCouponList = memberDAO.getMemberCouponList(member_email);
      ArrayList<CouponBean> couponInfoList = null;

      if(memberCouponList != null) {
    	  String[] arrCouponList = memberCouponList.split("/");
    	  couponInfoList = new ArrayList<CouponBean>();
    	  for(int i = 0; i < arrCouponList.length; i++) {
    		  couponInfoList.add(memberDAO.getCouponInfo(Integer.parseInt(arrCouponList[i])));
//         System.out.println(couponInfoList.toString());
    	  }
      }
      return couponInfoList;
   }
   
   // 쿠폰등록
   @Override
   public boolean registMemberCoupon(String inputCouponCode, String member_email) {
      System.out.println("MemberService - registMemberCoupon");
      boolean isRegisted = false;
      
      List<CouponBean> couponList = memberDAO.getCouponList();
      System.out.println(couponList);
      
      for(CouponBean couponBean : couponList) {
         if(inputCouponCode.equals(couponBean.getCoupon_name())) {
            memberDAO.registMemberCoupon(member_email, couponBean.getCoupon_idx());
            isRegisted = true;
         }
      }
      return isRegisted;
   }

// ---------------------------------------------   이메일 보내기 -----------------------------------------------   
   @Override
   public void sendWelcomeMail(MemberBean memberBean) {
      String setfrom = "javateamproject2021@gmail.com";
      String tomail = memberBean.getMember_email(); // 받는 사람 이메일
      String title = memberBean.getMember_name() + "님 회원가입을 축하드립니다."; // 제목
      String content = "<div align=\"center\" style=\"text-align: center;\"><span style=\"font-size: 24pt; font-family: arial, sans-serif;\">"
            + "<b>회원가입을 축하드립니다.</b></span></div><div align=\"center\" style=\"text-align: center;\">"
            + "<p align=\"center\" style=\"font-family: 돋움, Dotum, Helvetica, Apple SD Gothic Neo, sans-serif; font-size: 12px;\"><span style=\"font-size: 10pt; font-family: arial, sans-serif;\">회원가입이 성공적으로 완료되었습니다.</span></p>"
            + "<p align=\"center\" style=\"font-family: 돋움, Dotum, Helvetica, Apple SD Gothic Neo, sans-serif; font-size: 12px;\"><span style=\"font-size: 10pt; font-family: arial, sans-serif;\">지금 바로 신규 회원 쿠폰을 등록해보세요!</span></p>"
            + "<p align=\"center\" style=\"font-family: 돋움, Dotum, Helvetica, Apple SD Gothic Neo, sans-serif; font-size: 12px;\"><span style=\"font-size: 12pt; font-family: arial, sans-serif;\">"
            + "코드 번호 : <span style=\"background-color: rgb(255, 255, 255); font-size: 12pt; color: rgb(0, 0, 0); font-family: arial, sans-serif;\"><u>WELCOME2021</u></span></span></p>"
            + "<p align=\"center\" style=\"font-family: 돋움, Dotum, Helvetica, Apple SD Gothic Neo, sans-serif; font-size: 12px;\">"
            + "<span style=\"font-size: 12pt; font-family: arial, sans-serif;\"><span style=\"background-color: rgb(255, 255, 255); font-size: 12pt; color: rgb(0, 0, 0); font-family: arial, sans-serif;\"><br></span>"
            + "</span></p></div><div align=\"center\" style=\"text-align: center;\"><img src=\"https://image.flaticon.com/icons/png/512/1169/1169905.png\" alt=\"Coupons free icon\" style=\"width=\" height=\"240\"><br></div>"
            + "<div align=\"center\" style=\"text-align: center;\"><br></div><div align=\"center\" style=\"text-align: center;\">"
            + "<form action=\"http://localhost:8080/myweb2/main.sh\" method=\"get\"><input type=\"submit\" value=\"쿠폰 등록하러가기\" style=\"border:1px solid #f4f4f4; padding: 7px 15px; border-radius:8px; background-color: rgb(81, 143, 187);color:white; cursor: pointer;\"></form></div>"; // 내용

      try {
         MimeMessage message = mailSender.createMimeMessage();
         MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

         messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
         messageHelper.setTo(tomail); // 받는사람 이메일
         messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
         messageHelper.setText(content, true); // 메일 내용

         mailSender.send(message);
      } catch (Exception e) {
         System.out.println("메일 발송 실패 - " + e.getMessage());
      }
   }

}