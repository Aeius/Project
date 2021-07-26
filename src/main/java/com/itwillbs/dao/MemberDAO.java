package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.CouponBean;
import com.itwillbs.domain.MemberBean;

public interface MemberDAO {

	public int insertMember(MemberBean mb);

	public MemberBean userCheck(MemberBean mb);

	public MemberBean getMember(String id);

	public void updateMember(MemberBean memberBean);
	
	public void deleteMember(MemberBean memberBean);
	
	public String emailCheck(MemberBean mb);
	//이메일 찾기

	public String getCouponList(String member_email);

	public String getMemberCouponList(String member_email);

	public CouponBean getCouponInfo(int coupon_idx);

	public List<CouponBean> getCouponList();

	public void registMemberCoupon(String member_email, int coupon_idx);

}
