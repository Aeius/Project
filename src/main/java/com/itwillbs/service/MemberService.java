package com.itwillbs.service;

import com.itwillbs.domain.MemberBean;

public interface MemberService {
	// memberService.insertMember(mb); 추상메서드 생성
	public void insertMember(MemberBean mb);

	public MemberBean userCheck(MemberBean mb);

	public MemberBean getMember(String id);

}
