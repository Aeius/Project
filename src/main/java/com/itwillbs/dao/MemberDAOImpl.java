package com.itwillbs.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.CouponBean;
import com.itwillbs.domain.MemberBean;

@Repository
public class MemberDAOImpl implements MemberDAO{
	// 마이바티스 객체생성(생성자를 통해서 자동주입)
	@Inject
	private SqlSession sqlSession;
	
	// sql 구문 전체 이름 변수 정의
	private static final String namespace = "com.itwillbs.mapper.MemberMapper";

	@Override
	public int insertMember(MemberBean mb) {
		System.out.println("MemberDAOImpl insertMember");
//		sqlSession.insert(sql 구문, 값);
		int insertCount = sqlSession.insert(namespace + ".insertMember", mb);
		return insertCount;
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

	@Override
	public void updateMember(MemberBean memberBean) {
		sqlSession.update(namespace + ".updateMember", memberBean);
	}

	
	@Override
	public void deleteMember(MemberBean memberBean) {
		System.out.println("MemberDAOImpl - deleteMember");
		sqlSession.delete(namespace + ".deleteMember", memberBean);
		
	}
	
	@Override
	public String emailCheck(MemberBean mb) {
		System.out.println("MemberDAOImpl - emailCheck");
		//이메일찾기
		return sqlSession.selectOne(namespace + ".emailCheck",mb);
	}


	@Override
	public String getCouponList(String member_email) {
		return sqlSession.selectOne(namespace + ".getCouponList", member_email);
	}

	@Override
	public String getMemberCouponList(String member_email) {
		return sqlSession.selectOne(namespace + ".getMemberCouponList", member_email);
	}

	@Override
	public CouponBean getCouponInfo(int coupon_idx) {
		return sqlSession.selectOne(namespace + ".getCouponInfo", coupon_idx);
	}

	@Override
	public List<CouponBean> getCouponList() {
		return sqlSession.selectList(namespace + ".getCouponList");
	}

	@Override
	public void registMemberCoupon(String member_email, int coupon_idx) {
		System.out.println("MemberDAOImpl - registMemberCoupon");
		String strCouponIdx = Integer.toString(coupon_idx);
		HashMap<String, Object> map = new HashMap<>();
		map.put("member_email", member_email);
		map.put("coupon_idx",strCouponIdx);
		System.out.println(map);
		sqlSession.update(namespace + ".updateMemberCoupon", map);
	}
	
}