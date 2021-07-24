package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ReviewBean;

@Repository

public class ReviewDAOImpl implements ReviewDAO {

	// 마이바티스 객체생성(생성자를 통해서 자동주입)
		@Inject
		private SqlSession sqlSession;
		
		// sql 구문 전체 이름 변수 정의
		private static final String namespace = "com.itwillbs.mapper.ReviewMapper";
		
	@Override
	public void insertReview(ReviewBean reviewBean) {
		System.out.println("ReviewDAOImpl - insertReview");
		sqlSession.insert(namespace + ".insertReview", reviewBean);
	}

}
