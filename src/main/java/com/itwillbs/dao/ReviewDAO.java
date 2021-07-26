package com.itwillbs.dao;

import com.itwillbs.domain.ReviewBean;

import java.util.ArrayList;

import com.itwillbs.domain.ReviewBean;

public interface ReviewDAO {

//	void insertReview(ReviewBean reviewBean);

	public ArrayList<ReviewBean> getReviewList(String review_email);

	public void insertReview(ReviewBean reviewBean);

	public ReviewBean getReview(int review_product_idx);

	public void updateReview(ReviewBean reviewBean);

	public void deleteReview(int review_product_idx);

	

	

}
