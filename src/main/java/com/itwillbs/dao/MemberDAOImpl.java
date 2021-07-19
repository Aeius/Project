package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberBean;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	// 마이바티스 객체생성(생성자를 통해서 자동주입)
	@Inject
	private SqlSession sqlSession;
	
	//sql 구문 전체 이름 변수 정의
	private static final String namespace = "com.itwillbs.mapper.MemberMapper"; // sql 구문 불러오는 곳의 지정한 이름을 변수로 저장
	
	//--------------------------------------------------------------- insert -----------------------------------------------------------------------
	@Override
	public void insertMember(MemberBean mb) {
		System.out.println("MemberDAOImpl - insertMember()");
		
//		sqlSession.insert(sql구문, 값)
		sqlSession.insert(namespace + ".insertMember", mb);
		
		//MemberBean의 멤버변수의 이름 과 SQL 구문의 작성한 멤버변수(#{변수}) 이름이 동일해야한다.
		
	}
	//--------------------------------------------------------------- usercheck -----------------------------------------------------------------------
	@Override
	public MemberBean userCheck(MemberBean mb) {
		System.out.println("MemberDAOImpl - userCheck()");
		
		return sqlSession.selectOne(namespace + ".userCheck", mb);
	}
	
	//--------------------------------------------------------------- getMember -----------------------------------------------------------------------
	@Override
	public MemberBean getMember(String id) {
		
		return sqlSession.selectOne(namespace + ".getMember", id);
	}

	
}
