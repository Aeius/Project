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
import com.itwillbs.domain.SubscribeBean;

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
	public MemberBean getMemberByemail(String member_email) {
		  return memberDAO.getMemberByemail(member_email);
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
   
   //일치하는 계정이 있는지 확인함 (비밀번호 찾기)
 	@Override
 	public String passwordCheck(MemberBean mb) {
 		System.out.println("MemberServiceImpl - passwordCheck");
 		return memberDAO.passwordCheck(mb);
 	}
 	
   
 	//임시비번 만들어서 update해주는 메소드
 	@Override
 	public void updateTempPassword(MemberBean mb) {
 		System.out.println("임시비번 tempPassword 를 DB에 업데이트 시도_serviceImpl");
 		memberDAO.updatePassword(mb);
 	}
 	
 	//임시 비밀번호를 발급해서 이메일로 보내주는 메서드
	@Override
	public void sendTempPassword(MemberBean mb) {

		
		 String setfrom = "javateamproject2021@gmail.com";
	      String tomail = mb.getMember_email(); // 받는 사람 이메일
	      String title = mb.getMember_name() + "님의 임시 비밀번호를 전달해 드립니다. "; // 제목
	      String tempPass = mb.getMember_password();
	      
	      String content = "<p align=\"center\" style=\"text-align: center; \">&nbsp;<span style=\"font-size: 10pt;\">&nbsp;</span></p><p align=\"center\" style=\"text-align: center; \">"
	      		+ "<img src=\"https://postfiles.pstatic.net/MjAyMTA4MDRfMTA3/MDAxNjI4MDU3ODE4MDM3.dQGrbYYH-OB9Pi7lo8CDH97BbHOhbvmWRLB66QJkbcAg.0Xx2qYIHIMjO6hGspDI-Z5M7kCNLnBL7EgK54rpZl3og.JPEG.honamory/logo_proto_1.jpg?type=w966\" loading=\"lazy\"></p>"
	      		+ "<p align=\"center\" style=\"text-align: center; \">&nbsp;</p><p align=\"center\" style=\"text-align: center; \">&nbsp;</p><p align=\"center\" style=\"text-align: center; \">&nbsp;</p>"
	      		+ "<p align=\"center\" style=\"text-align: center; \"><span style=\"font-family: dotum, sans-serif;\">안녕하세요 회원님,</span></p><p align=\"center\" style=\"text-align: center; \">&nbsp;</p>"
	      		+ "<p align=\"center\" style=\"text-align: center; \">&nbsp;</p><p align=\"center\" style=\"text-align: center; \"><span style=\"font-family: dotum, sans-serif;\">회원님의 임시 비밀번호를&nbsp;</span></p><p align=\"center\" style=\"text-align: center; \">"
	      		+ "<span style=\"font-family: dotum, sans-serif;\">아래와 같이 전달해 드립니다.</span></p><p align=\"center\" style=\"text-align: center; \">&nbsp;</p>"
	      		+ "<p align=\"center\" style=\"text-align: center; \">&nbsp;</p><p align=\"center\" style=\"text-align: center; \">"
	      		+ "<b><span style=\"font-size: 9pt; font-family: dotum, sans-serif;\">임시 비밀번호:&nbsp;</span>"
	      		+ "</b><span style=\"font-family: dotum, sans-serif; font-size: 9pt;\">["+tempPass+"]</span>" //임시비밀번호!! 
	      		+ "</p><p align=\"center\" style=\"text-align: center; \">&nbsp;</p><p align=\"center\" style=\"text-align: center; \">"
	      		+ "&nbsp;</p><p align=\"center\" style=\"text-align: center; \">&nbsp;</p><p align=\"center\" style=\"text-align: center; \">"
	      		+ "<span style=\"font-family: dotum, sans-serif;\">이 비밀번호로 로그인 하셔서</span></p><p align=\"center\" style=\"text-align: center; \">"
	      		+ "<span style=\"font-family: dotum, sans-serif;\">새로운 비밀번호로&nbsp;</span></p>"
	      		+ "<p align=\"center\" style=\"text-align: center; \"><span style=\"font-family: dotum, sans-serif;\">변경하여 주시기 바랍니다.</span>"
	      		+ "</p><p align=\"center\" style=\"text-align: center; \">&nbsp;</p><p align=\"center\" style=\"text-align: center; \">&nbsp;</p>"
	      		+ "<p align=\"center\" style=\"text-align: center; \"><span style=\"font-family: dotum, sans-serif;\">"
	      		+ "<b><a href=\"http://localhost:8080/myweb2/login.sh\" target=\"_blank\" style=\"cursor: pointer; white-space: pre;\" rel=\"noreferrer noopener\">"
	      		+ "로그인 하러 가기</a><span></span></b></span></p><p align=\"center\" style=\"text-align: center; \">&nbsp;</p><p align=\"center\" style=\"text-align: center; \">&nbsp;</p>"
	      		+ "<p align=\"center\" style=\"text-align: center; \">&nbsp;</p><p align=\"center\" style=\"text-align: center; \">"
	      		+ "<span style=\"font-family: dotum, sans-serif;\">※비밀번호 찾기 신청을&nbsp;</span><span style=\"font-size: 10pt; font-family: dotum, sans-serif;\">하시지 않았다면</span></p>"
	      		+ "<p align=\"center\" style=\"text-align: center; \"><span style=\"font-family: dotum, sans-serif;\"><span></span><a href=\"http://localhost:8080/myweb2/notice.sh\" target=\"_blank\" style=\"cursor: pointer; white-space: pre;\" rel=\"noreferrer noopener\">"
	      		+ "고객센터</a><span></span>로 연락해 주세요.</span></p><p align=\"center\" style=\"text-align: center; \">&nbsp;</p><p align=\"center\" style=\"text-align: center; \">&nbsp;</p><p align=\"center\" style=\"text-align: center; \">&nbsp;</p><p align=\"center\" style=\"text-align: center; \">"
	      		+ "<span style=\"font-size: 10pt;\">&nbsp;</span>&nbsp;</p>\r\n"
	      		+ "\r\n"
	      		+ "";

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
 	
 	
 	
 //---------------------------------------------------------------  고객 쿠폰 리스트 조회 ------------------------------------------------------------
   @Override
   public ArrayList<CouponBean> getMemberCouponList(String member_email) {
	  // 쿠폰 리스트를 담을 객체 선언
	  ArrayList<CouponBean> couponInfoList = null;
	  // 쿠폰 리스트 가져오기
      String memberCouponList = memberDAO.getMemberCouponList(member_email);
      
      if(memberCouponList != null) {
    	  // 고객 쿠폰 정보를 가져왔을 때 '/'로 분리
    	  String[] arrCouponList = memberCouponList.split("/");
    	  // 쿠폰 리스트를 담을 객체 생성
    	  couponInfoList = new ArrayList<CouponBean>();
    	  // 쿠폰 정보 조회해서 쿠폰 리스트 객체에 담기
    	  for(int i = 0; i < arrCouponList.length; i++) {
    		  couponInfoList.add(memberDAO.getCouponInfo(Integer.parseInt(arrCouponList[i])));
//         System.out.println(couponInfoList.toString());
    	  }
      }
      return couponInfoList;
   }
   
//--------------------------------------------------------------- 쿠폰 등록 ------------------------------------------------------------
//	@Override
//	public boolean registMemberCoupon(String inputCouponCode, String member_email) {
//		System.out.println("MemberService - registMemberCoupon");
//		boolean isRegisted = false;
//		ArrayList<CouponBean> couponInfoList = null;
//	    
//		// 쿠폰 테이블 조회
//		List<CouponBean> couponList = memberDAO.getCouponList();
////		System.out.println(couponList);
//		
//		// 쿠폰 테이블을 하나씩 조회하는 반복문
//		for(CouponBean couponBean : couponList) {
//			// 입력 쿠폰 코드와 쿠폰 테이블에 등록된 쿠폰 코드가 일치하는 경우
//			if(inputCouponCode.equals(couponBean.getCoupon_name())) {
//				// 고개 쿠폰 정보 조회
//				String memberCouponList = memberDAO.getMemberCouponList(member_email);
//			      // 고객 쿠폰 정보가 존재할 경우
//			      if(memberCouponList != null) {
//			    	  // 고객 쿠폰 정보를 '/'로 분리
//			    	  String[] arrMemberCoupon_idxList = memberCouponList.split("/");
//			    	  // 
//			    	  for(String memberCoupon_idx : arrMemberCoupon_idxList) {
//			    		  if(memberCoupon_idx.equals(Integer.toString(couponBean.getCoupon_idx()))) {
//			    			  return isRegisted;
//			    		  } else {
//			    			  memberDAO.registMemberCoupon(member_email, couponBean.getCoupon_idx());
//			    		  }
////			         System.out.println(couponInfoList.toString());
//			    	  }
//			      } else { // 고개 쿠폰 정보가 존재하지 않을 경우
//			    	  // 쿠폰 등록
//			    	  memberDAO.registMemberCoupon(member_email, couponBean.getCoupon_idx());
//			      }
//				isRegisted = true;
//			}
//		}
//		return isRegisted;
//	}
	
//--------------------------------------------------------------- 쿠폰 등록 ------------------------------------------------------------
	@Override
	public boolean registMemberCoupon(String inputCouponCode, String member_email) {
		// 등록 여부 판별할 boolean 객체 
		boolean isRegisted = false;
		int duplicateCount = 0;
		
		// 입력 문자열에 대한 쿠폰 정보 가져오기
		CouponBean couponBean = memberDAO.getCouponInfo_CouponCode(inputCouponCode);
		if(couponBean == null) { // 쿠폰 정보가 없을 때 = 문자열 일치하지 않을 때
			System.out.println("registMemberCoupon - 문자열 불일치");
			return isRegisted; // 등록 불가
		} else { // 입력 문자열과 일치하는 쿠폰 정보가 있을 때 = 문자열 일치
			System.out.println("registMemberCoupon - 문자열 일치");
			if(couponBean.isCoupon_status()) {
				// 고객 쿠폰 정보 가져오기
				String memberCouponList = memberDAO.getMemberCouponList(member_email);
				
				if(memberCouponList == null) { // 고객 쿠폰 정보가 없음 = 등록된 쿠폰 없음
					System.out.println("registMemberCoupon - 고객 쿠폰 없음");
					memberDAO.registMemberCoupon(member_email, couponBean.getCoupon_idx());
					isRegisted = true;
					return isRegisted;
					
				} else { // 고객 쿠폰 정보가 있음 = 등록된 쿠폰과 등록할 쿠폰 비교 필요
					System.out.println("registMemberCoupon - 고객 쿠폰 있음");
					
					// 고객 쿠폰 정보 분리
					String[] arrMemberCoupon_idxList = memberCouponList.split("/");
					
					// 하나씩 비교
					for(String memberCoupon_idx : arrMemberCoupon_idxList) {
						if(memberCoupon_idx.equals(Integer.toString(couponBean.getCoupon_idx()))) {
							// 고객 쿠폰 정보의 쿠폰 번호와 입력한 쿠폰 코드의 번호가 일치할 때
							System.out.println("registMemberCoupon - 고객 일치하는 쿠폰 있음");
							// 중복 숫자를 체크하는 변수 1 증가
							duplicateCount++;
						}
					}
					// 중복 값 체크하는 변수가 1 이상일 때 = 중복이 있음
					if(duplicateCount > 0) {
						System.out.println("중복쿠폰 있음 : " + duplicateCount);
						return isRegisted; // 등록 불가 -> false 리턴
					} else {
						// 중복 값이 0일 떄 = 중복 없음
						System.out.println("중복쿠폰 없음 : " + duplicateCount);
						memberDAO.registMemberCoupon(member_email, couponBean.getCoupon_idx());
						isRegisted = true;
					}
				}
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
   
   
// --------------------------------------------- 비밀번호 변경 -----------------------------------------------   
    @Override
	public void updatePassword(MemberBean memberBean) {
		memberDAO.updatePassword(memberBean);
	}

// --------------------------------------------- ??? -----------------------------------------------   
	//관리자 페이지 : 구독자만 관리
	@Override
	public List<MemberBean> getSubMemberList() {
		return memberDAO.getSubMemberList();
	}
	
//	@Override
//	public void sendResubscribeMail(SubscribeBean subscribeBean) {
//		String setfrom = "javateamproject2021@gmail.com";
//	    String tomail = subscribeBean.getSubscribe_email(); // 받는 사람 이메일
//	    String title = "구독을 연장해보시는 건 어떤가요?"; // 제목
//	    String content = "<div align=\"center\" style=\"text-align: center;\"><span style=\"font-size: 24pt; font-family: arial, sans-serif;\">"
//	          + "<b>구독을 이용해주셔서 감사합니다.</b></span></div><div align=\"center\" style=\"text-align: center;\">"
//	          + "<p align=\"center\" style=\"font-family: 돋움, Dotum, Helvetica, Apple SD Gothic Neo, sans-serif; font-size: 12px;\"><span style=\"font-size: 10pt; font-family: arial, sans-serif;\">구독 만료기간이 도래하여 갱신하실 수 있도록 알려드립니다.</span></p>"
//	          + "<p align=\"center\" style=\"font-family: 돋움, Dotum, Helvetica, Apple SD Gothic Neo, sans-serif; font-size: 12px;\"><span style=\"font-size: 10pt; font-family: arial, sans-serif;\">지금 바로 기간을 연장하시고 구독 감사 쿠폰을 등록해보세요!</span></p>"
//	          + "<p align=\"center\" style=\"font-family: 돋움, Dotum, Helvetica, Apple SD Gothic Neo, sans-serif; font-size: 12px;\"><span style=\"font-size: 12pt; font-family: arial, sans-serif;\">"
//	          + "코드 번호 : <span style=\"background-color: rgb(255, 255, 255); font-size: 12pt; color: rgb(0, 0, 0); font-family: arial, sans-serif;\"><u>THANKS2021</u></span></span></p>"
//	          + "<p align=\"center\" style=\"font-family: 돋움, Dotum, Helvetica, Apple SD Gothic Neo, sans-serif; font-size: 12px;\">"
//	          + "<span style=\"font-size: 12pt; font-family: arial, sans-serif;\"><span style=\"background-color: rgb(255, 255, 255); font-size: 12pt; color: rgb(0, 0, 0); font-family: arial, sans-serif;\"><br></span>"
//	          + "</span></p></div><div align=\"center\" style=\"text-align: center;\"><img src=\"https://image.flaticon.com/icons/png/512/1169/1169905.png\" alt=\"Coupons free icon\" style=\"width=\" height=\"240\"><br></div>"
//	          + "<div align=\"center\" style=\"text-align: center;\"><br></div><div align=\"center\" style=\"text-align: center;\">"
//	          + "<form action=\"http://localhost:8080/myweb2/main.sh\" method=\"get\"><input type=\"submit\" value=\"쿠폰 등록하러가기\" style=\"border:1px solid #f4f4f4; padding: 7px 15px; border-radius:8px; background-color: rgb(81, 143, 187);color:white; cursor: pointer;\"></form></div>"; // 내용
//
//	    try {
//	       MimeMessage message = mailSender.createMimeMessage();
//	       MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
//
//	       messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
//	       messageHelper.setTo(tomail); // 받는사람 이메일
//	       messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
//	       messageHelper.setText(content, true); // 메일 내용
//
//	       mailSender.send(message);
//	    } catch (Exception e) {
//	       System.out.println("메일 발송 실패 - " + e.getMessage());
//	    }
//	}

}