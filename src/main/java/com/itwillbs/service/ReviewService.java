package com.itwillbs.service;

import java.util.ArrayList;

import com.itwillbs.domain.PageBean;
import com.itwillbs.domain.ReviewBean;

public interface ReviewService {

	public ArrayList<ReviewBean> getReviewList(String review_email);

	public void insertReview(ReviewBean reviewBean);

	public ReviewBean getReview(int review_product_idx);

	public void updateReview(ReviewBean reviewBean);

	public void deleteReview(int review_product_idx);

	public ArrayList<ReviewBean> getReviewListPage(PageBean pb);

	public Integer getReviewListCount(String member_email);

	ArrayList<ReviewBean> getProductReview(int product_idx);

	public ArrayList<ReviewBean> getProductReviewListPage(PageBean pb);

	public Integer getProductReviewCount(int product_idx);

	

}
