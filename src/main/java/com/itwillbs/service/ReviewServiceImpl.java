package com.itwillbs.service;

import java.sql.Date;
import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ReviewDAO;
import com.itwillbs.domain.ReviewBean;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Inject
	private ReviewDAO reviewDAO;
	
//	@Override
//	public void insertReview(ReviewBean reviewBean) {
//		reviewBean.setMember_date(new Date(System.currentTimeMillis()));
//		reviewDAO.insertReview(reviewBean);
//	}

	@Override
	public ArrayList<ReviewBean> getReviewList(String review_email) {
		System.out.println("ReviewServiceImpl-getReviewList");
//		System.out.println(review_email);
		return reviewDAO.getReviewList(review_email);
	}

	@Override
	public void insertReview(ReviewBean reviewBean) {
		System.out.println("ReviewServiceImpl-insertReview");
		reviewBean.setReview_date(new Date(System.currentTimeMillis()));
		reviewDAO.insertReview(reviewBean);
	}

	@Override
	public ReviewBean getReview(int review_product_idx) {
		System.out.println("ReviewServiceImpl-getReview");
		return reviewDAO.getReview(review_product_idx);
	}

	@Override
	public void updateReview(ReviewBean reviewBean) {
		System.out.println("ReviewServiceImpl-updateReview");
		reviewDAO.updateReview(reviewBean);
	}

	@Override
	public void deleteReview(int review_product_idx) {
		System.out.println("ReviewServiceImpl-updateReview");
		reviewDAO.deleteReview(review_product_idx);
		
	}


}
