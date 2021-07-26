package com.itwillbs.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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

	
// -----------------------------------리뷰 작성---------------------------------------------------
	@RequestMapping(value = "/reviewForm.sh", method = RequestMethod.GET)
	public String review(@RequestParam("product_idx") int product_idx, HttpSession session, Model model) {
		String review_email = (String)session.getAttribute("member_email");
		System.out.println(review_email);
		model.addAttribute("review_email", review_email);
		model.addAttribute("product_idx", product_idx);
		return "/dailyShop/member/reviewForm";
	}

// -----------------------------------리뷰 등록 처리---------------------------------------------------
	@RequestMapping(value = "/reviewWritePro.sh", method = RequestMethod.POST)
	public String reviewWritePro(ReviewBean reviewBean, Model model) {
//		System.out.println(reviewBean.getReview_email());
//		System.out.println(reviewBean.getReview_star());
//		System.out.println(reviewBean.getReview_product_idx());
//		System.out.println(reviewBean.getReview_content());
		
		reviewService.insertReview(reviewBean);	
		return "/dailyShop/member/myReview";
	}
// -----------------------------------리뷰 수정---------------------------------------------------	
	@RequestMapping(value = "/reviewUpdateForm.sh", method = RequestMethod.GET)
	public String reviewUpdate(@RequestParam("product_idx") int product_idx,Model model) {
		int review_product_idx = product_idx;
		System.out.println(product_idx);
		ReviewBean reviewBean = reviewService.getReview(review_product_idx);
		
		model.addAttribute("reviewBean", reviewBean);
		return "/dailyShop/member/reviewUpdateForm";
	}
	
	@RequestMapping(value = "/reviewUpdatePro.sh", method = RequestMethod.POST)
	public String reviewUpdatePro(ReviewBean reviewBean,Model model) {
		reviewService.updateReview(reviewBean);
		model.addAttribute("reviewBean", reviewBean);
		return "redirect:/reviewList.sh";
	}
	
	// -----------------------------------리뷰 삭제---------------------------------------------------		
	@RequestMapping(value = "/reviewDeletePro.sh", method = RequestMethod.GET)
	public String reviewDeltePro(@RequestParam("product_idx") int product_idx, Model model,HttpSession session) {
		int review_product_idx = product_idx;
		System.out.println(review_product_idx);
		reviewService.deleteReview(review_product_idx);
		
		return "redirect:/reviewList.sh";
	}
	
// -----------------------------------내 리뷰 리스트---------------------------------------------------
	
	@RequestMapping(value = "/reviewList.sh", method = RequestMethod.GET)
	public String ReviewList(HttpSession session, Model model) {
		
		String review_email = (String)session.getAttribute("member_email");
//		System.out.println(review_email);
		// member 정보 전체를 조회
		ArrayList<ReviewBean> reviewList = reviewService.getReviewList(review_email);
		
		Map ratingOptions = new HashMap();
		ratingOptions.put(0, "☆☆☆☆☆");
		ratingOptions.put(1, "★☆☆☆☆");
		ratingOptions.put(2, "★★☆☆☆");
		ratingOptions.put(3, "★★★☆☆");
		ratingOptions.put(4, "★★★★☆");
		ratingOptions.put(5, "★★★★★");
		model.addAttribute("ratingOptions", ratingOptions);
		//Model 데이터 담아 가기
		model.addAttribute("reviewList" , reviewList);
		
		return "/dailyShop/member/myReview";
	}
}
