package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberBean;

@Repository
public class MemberDAOImpl implements MemberDAO{
	// 마이바티스 객체생성(생성자를 통해서 자동주입)
	@Inject
	private SqlSession sqlSession;
	
	// sql 구문 전체 이름 변수 정의
	private static final String namespace = "com.itwillbs.mapper.MemberMapper";

	@Override
	public void insertMember(MemberBean mb) {
		System.out.println("MemberDAOImpl insertMember");
//		sqlSession.insert(sql 구문, 값);
		sqlSession.insert(namespace + ".insertMember", mb);
		
	}

	@Override
	public MemberBean userCheck(MemberBean mb) {
		System.out.println("MemberDAOImpl userCheck");
		return sqlSession.selectOne(namespace + ".userCheck" , mb);
	}

	@Override
	public MemberBean getMember(String id) {
		System.out.println("MemberDAOImpl - getMember");
		
		return sqlSession.selectOne(namespace + ".getMember",id);
	}
	
	

}
