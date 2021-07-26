package com.itwillbs.dao;

import java.util.ArrayList;

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

	@Override
	public ArrayList<ReviewBean> getReviewList(String review_email) {
		System.out.println("ReviewDAOImpl-reviewList");
		return (ArrayList) sqlSession.selectList(namespace + ".getReviewList", review_email);

	}

	@Override
	public ReviewBean getReview(int review_product_idx) {
		return sqlSession.selectOne(namespace + ".getReview", review_product_idx);

	}

	@Override
	public void updateReview(ReviewBean reviewBean) {
		System.out.println("ReviewDAOImpl-updateReview");
		sqlSession.update(namespace + ".updateReview", reviewBean);
	}

	@Override
	public void deleteReview(int review_product_idx) {
		System.out.println("ReviewDAOImpl-deleteReview");
		sqlSession.delete(namespace + ".deleteReview", review_product_idx);

	}

}
