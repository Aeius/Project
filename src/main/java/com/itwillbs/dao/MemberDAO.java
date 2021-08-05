package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.CouponBean;
import com.itwillbs.domain.MemberBean;

public interface MemberDAO {

   public int insertMember(MemberBean mb);

   public MemberBean userCheck(MemberBean mb);

   public MemberBean getMember(String id);
   
   public MemberBean getMemberByemail(String member_email);

   public void updateMember(MemberBean memberBean);
   
   public void deleteMember(MemberBean memberBean);
   
   public List<MemberBean> getMemberList();
   
   public String emailCheck(MemberBean mb);
   //이메일 찾기
   public String passwordCheck(MemberBean mb);
   //비번찾기-일치하는 정보 있는지 DB에서 확인
   
   public void updatePassword(MemberBean mb);
   //임시비번 DB에 업데이트

   public String getMemberCouponList(String member_email);

   public CouponBean getCouponInfo(int coupon_idx);

   public List<CouponBean> getCouponList();

   public void registMemberCoupon(String member_email, int coupon_idx);

   //관리자 페이지 : 구독자만 관리
   public List<MemberBean> getSubMemberList();

   public CouponBean getCouponInfo_CouponCode(String inputCouponCode);

	public void updateCoupon(CouponBean couponBean);
	
	public void updatePoint(MemberBean memberBean);

}