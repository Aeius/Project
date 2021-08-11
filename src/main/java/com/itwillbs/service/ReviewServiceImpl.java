package com.itwillbs.service;

import java.sql.Date;
import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ReviewDAO;
import com.itwillbs.domain.PageBean;
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
	public ArrayList<ReviewBean> getProductReview(int product_idx) {
		System.out.println("ReviewServiceImpl-getProductReview");
		return reviewDAO.getProductReview(product_idx);
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

	@Override
	public ArrayList<ReviewBean> getReviewListPage(PageBean pb) {
		// 페이지 관련 처리 pageNum, pageSize 담아옴
				// currentPage startRow-1 endRow 계산
				pb.setCurrentPage(Integer.parseInt(pb.getPageNum()));
				pb.setStartRow((pb.getCurrentPage()-1)*pb.getPageSize()+1-1);
//				pb.setEndPage(((pb.getCurrentPage()-1)*pb.getPageSize()+1)+pb.getPageSize()-1);
				
		System.out.println("ReviewServiceImpl-getReviewListPage");
		return reviewDAO.getReviewListPage(pb);
	}

	@Override
	public Integer getReviewListCount(String member_email) {
		System.out.println("ReviewServiceImpl-getReviewListCount");
		return reviewDAO.getReviewListCount(member_email);
	}


}
