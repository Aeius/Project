package com.itwillbs.dao;

import com.itwillbs.domain.MemberBean;

public interface MemberDAO {

	public void insertMember(MemberBean mb);

	public MemberBean userCheck(MemberBean mb);

	public MemberBean getMember(String id);

}
