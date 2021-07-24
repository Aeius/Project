package com.itwillbs.dao;

import com.itwillbs.domain.CouponBean;
import com.itwillbs.domain.MemberBean;

public interface MemberDAO {

	public void insertMember(MemberBean mb);

	public MemberBean userCheck(MemberBean mb);

	public MemberBean getMember(String id);

	public void updateMember(MemberBean memberBean);
	
	public void deleteMember(MemberBean memberBean);
	
	public String emailCheck(MemberBean mb);
	//이메일 찾기

	public String getCouponList(String member_email);

	public CouponBean getCouponInfo(int coupon_idx);

}
