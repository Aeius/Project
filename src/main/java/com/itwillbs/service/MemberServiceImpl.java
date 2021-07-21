package com.itwillbs.service;

import java.sql.Timestamp;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberBean;

@Service
public class MemberServiceImpl implements MemberService {
	
	// xml에서 객체생성한것을 set 메서드를 통해서 부모인터페이스 멤버변수에 객체 생성한 것을 자동으로 전달 받기(Inject 사용)
	@Inject
	private MemberDAO memberDAO;
	
	@Override
	public void insertMember(MemberBean mb) {
		// 날짜 처리
		mb.setDate(new Timestamp(System.currentTimeMillis()));
		// MemberDAOImpl 메서드 호출
		
		// MemberDAOImpl 메서드 호출
		memberDAO.insertMember(mb);
		
	}

	@Override
	public MemberBean userCheck(MemberBean mb) {
		System.out.println("userCheck");
		
		
		return memberDAO.userCheck(mb);
	}

	@Override
	public MemberBean getMember(String id) {
		System.out.println("getMember");
		
		return memberDAO.getMember(id);
	}

}
