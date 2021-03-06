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
//      sqlSession.insert(sql 구문, 값);
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
	public List<MemberBean> getMemberList() {
		System.out.println("MemberDAOImpl - getMemberList()");
		return sqlSession.selectList(namespace+".getMemberList");
	}
   
   //이메일찾기
   @Override
   public String emailCheck(MemberBean mb) {
      System.out.println("MemberDAOImpl - emailCheck");
      return sqlSession.selectOne(namespace + ".emailCheck",mb);
   }
   
   //일치하는 패스워드 있는지 찾기
   @Override
	public String passwordCheck(MemberBean mb) {
		System.out.println("MemberDAO - 비번 체크");
		return sqlSession.selectOne(namespace +".passwordCheck", mb);
	}
  
	//임시비번 DB등록
	@Override
	public void updatePassword(MemberBean mb) {
		System.out.println("임시비번 tempPassword 를 DB에 업데이트 시도_DAOImpl");
		sqlSession.update(namespace+".updatePassword", mb);
	}
   
   

//   고객 쿠폰 리스트 조회
   @Override
   public String getMemberCouponList(String member_email) {
      return sqlSession.selectOne(namespace + ".getMemberCouponList", member_email);
   }

//   특정 쿠폰 정보 조회
   @Override
   public CouponBean getCouponInfo(int coupon_idx) {
      return sqlSession.selectOne(namespace + ".getCouponInfo", coupon_idx);
   }
   
//   쿠폰 전체 조회
   @Override
   public List<CouponBean> getCouponList() {
      return sqlSession.selectList(namespace + ".getCouponList");
   }
   
//   고객 쿠폰 등록
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
   
    //특정 쿠폰 정보 조회
	@Override
	public CouponBean getCouponInfo_CouponCode(String coupon_name) {
		return sqlSession.selectOne(namespace + ".getCouponInfo_CouponCode", coupon_name);
	}

   
   	//관리자 페이지 : 구독자만 관리
	@Override
	public List<MemberBean> getSubMemberList() {
		System.out.println("MemberDAOImpl - getSubMemberList()");
		return sqlSession.selectList(namespace+".getSubMemberList");
	}

	@Override
	public MemberBean getMemberByemail(String member_email) {
		  return sqlSession.selectOne(namespace + ".getMemberByemail",member_email);
	}

	@Override
	public void updateCoupon(CouponBean couponBean) {
		sqlSession.insert(namespace+".insertCouponStatus", couponBean);
		
	}

	@Override
	public void usePoint(MemberBean memberBean) {
		sqlSession.update(namespace +".usePoint",memberBean);
	}

	@Override
	public void addPoint(MemberBean memberBean) {
		sqlSession.update(namespace +".addPoint",memberBean);
		
	}

	@Override
	public int isUsedCoupon(String member_email, int coupon_idx) {
		System.out.println("MemberDAOImpl - registMemberCoupon");
	      String strCouponIdx = Integer.toString(coupon_idx);
	      HashMap<String, Object> map = new HashMap<>();
	      map.put("member_email", member_email);
	      map.put("coupon_idx",strCouponIdx);
	      System.out.println(map);
	      return sqlSession.selectOne(namespace + ".isUsedCoupon", map);
	}

	@Override
	public void updateMyCoupon(String coupon_idx, String member_email) {
	      HashMap<String, Object> map = new HashMap<>();
	      map.put("member_email", member_email);
	      map.put("coupon_idx",coupon_idx);
	      System.out.println(map);
		sqlSession.update(namespace + ".updateMemberCoupon", map);
		
	}

}