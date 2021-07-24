package com.itwillbs.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.ReviewBean;
import com.itwillbs.service.ReviewService;

@Controller
public class ReviewController {
	@Inject
	private ReviewService reviewService;

	@RequestMapping(value = "/review.sh", method = RequestMethod.GET)
	public String Review() {
		return "/dailyShop/member/reviewForm";
	}
	
	@RequestMapping(value = "/reviewInsertPro.sh", method = RequestMethod.GET)
	public String reviewInsertPro(ReviewBean reviewBean) {
		reviewService.insertReview(reviewBean);
		
		return "/dailyShop/member/orderList";
	}
	
	
}
