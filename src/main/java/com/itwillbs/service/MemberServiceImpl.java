package com.itwillbs.service;

import java.sql.Timestamp;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberBean;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO memberDAO;
	
	//--------------------------------------------------------------- insert -----------------------------------------------------------------------
	@Override
	public void insertMember(MemberBean mb) {
		System.out.println("MemberServiceImpl - insertMember()");
		
		// 날짜 처리
		mb.setDate(new Timestamp(System.currentTimeMillis()));
		
		//MemberDAOImpl 메서드 호출
		memberDAO.insertMember(mb);
		
	}
	
	//--------------------------------------------------------------- userCheck -----------------------------------------------------------------------
	@Override
	public MemberBean userCheck(MemberBean mb) {
		
		return memberDAO.userCheck(mb);
	}

	//--------------------------------------------------------------- getMember -----------------------------------------------------------------------

	@Override
	public MemberBean getMember(String id) {
		
		return memberDAO.getMember(id);
	}
	
}
