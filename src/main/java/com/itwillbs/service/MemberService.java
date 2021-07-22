package com.itwillbs.service;

import com.itwillbs.domain.MemberBean;

public interface MemberService {
	// memberService.insertMember(mb); 추상메서드 생성
	public void insertMember(MemberBean mb);

	public MemberBean userCheck(MemberBean mb);

	public MemberBean getMember(String id);

	public void updateMember(MemberBean memberBean);
	
	public void deleteMember(MemberBean memberBean);

}
