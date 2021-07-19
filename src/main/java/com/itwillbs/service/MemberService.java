package com.itwillbs.service;

import com.itwillbs.domain.MemberBean;

public interface MemberService {

	public void insertMember(MemberBean mb);

	public MemberBean userCheck(MemberBean mb);

	public MemberBean getMember(String id);

}
