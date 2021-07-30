package com.itwillbs.service;

import java.util.ArrayList;
import java.util.List;

import com.itwillbs.domain.CouponBean;
import com.itwillbs.domain.MemberBean;
import com.itwillbs.domain.SubscribeBean;

public interface MemberService {
   // memberService.insertMember(mb); 추상메서드 생성
   public boolean insertMember(MemberBean mb);

   public MemberBean userCheck(MemberBean mb);

   public MemberBean getMember(String id);

   public void updateMember(MemberBean memberBean);
   
   public void deleteMember(MemberBean memberBean);
   
   public List<MemberBean> getMemberList();
   
   public String emailCheck(MemberBean mb);

   public ArrayList<CouponBean> getMemberCouponList(String member_email);

   public boolean registMemberCoupon(String inputCouponCode, String member_email);

   public void sendWelcomeMail(MemberBean memberBean);

   //관리자 페이지 : 구독자만 관리
   public List<MemberBean> getSubMemberList();

//   public void sendResubscribeMail(SubscribeBean subscribeBean);



}