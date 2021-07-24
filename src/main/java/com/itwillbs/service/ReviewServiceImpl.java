package com.itwillbs.service;

import java.sql.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ReviewDAO;
import com.itwillbs.domain.ReviewBean;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Inject
	private ReviewDAO reviewDAO;
	
	@Override
	public void insertReview(ReviewBean reviewBean) {
		reviewBean.setMember_date(new Date(System.currentTimeMillis()));
		reviewDAO.insertReview(reviewBean);
	}

}
