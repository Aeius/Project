package com.itwillbs.service;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.CouponBean;
import com.itwillbs.domain.MemberBean;

@Service
public class MemberServiceImpl implements MemberService {
	
	// xml에서 객체생성한것을 set 메서드를 통해서 부모인터페이스 멤버변수에 객체 생성한 것을 자동으로 전달 받기(Inject 사용)
	@Inject
	private MemberDAO memberDAO;
	
	@Override
	public void insertMember(MemberBean mb) {
		// 날짜 처리
		mb.setMember_date(new Date(System.currentTimeMillis()));
		// MemberDAOImpl 메서드 호출
		
		// MemberDAOImpl 메서드 호출
		memberDAO.insertMember(mb);
		
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
	public String emailCheck(MemberBean mb) {
		//
		System.out.println("userCheck");
		return memberDAO.emailCheck(mb);
	}


	@Override
	public ArrayList<CouponBean> getCouponList(String member_email) {
		String couponList = memberDAO.getCouponList(member_email);
		String[] arrCouponList = couponList.split("/");
		ArrayList<CouponBean> couponInfoList = new ArrayList<CouponBean>();
		for(int i = 0; i < arrCouponList.length; i++) {
			couponInfoList.add(memberDAO.getCouponInfo(Integer.parseInt(arrCouponList[i])));
			System.out.println(couponInfoList.toString());
		}
		return couponInfoList;
	}
	


}
