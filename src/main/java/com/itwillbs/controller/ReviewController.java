package com.itwillbs.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import com.itwillbs.domain.ReviewBean;
import com.itwillbs.service.ReviewService;

@Controller
public class ReviewController {
	@Inject
	private ReviewService reviewService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
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
	public String reviewWritePro(HttpServletRequest request, @RequestParam("review_image") MultipartFile review_image) throws Exception{
//		System.out.println(reviewBean.getReview_email());
//		System.out.println(reviewBean.getReview_star());
//		System.out.println(reviewBean.getReview_product_idx());
//		System.out.println(reviewBean.getReview_content());
		// 랜덤문자열 생성  랜덤문자열_파일이름
				UUID uid=UUID.randomUUID();
				String saveName=uid.toString()+"_"+review_image.getOriginalFilename();
				System.out.println(saveName);
				
				// 올리파일을 => upload폴더 복사(파일카피)
				File target=new File(uploadPath,saveName);
				FileCopyUtils.copy(review_image.getBytes(), target);
				
				// BoardBean bb 객체생성
				// 멤버변수 파라미터값 저장
				ReviewBean reviewBean=new ReviewBean();
				reviewBean.setReview_product_idx(Integer.parseInt(request.getParameter("review_product_idx")));
				reviewBean.setReview_email(request.getParameter("review_email"));
				reviewBean.setReview_subject(request.getParameter("review_subject"));
				reviewBean.setReview_content(request.getParameter("review_content"));
				reviewBean.setReview_star(Integer.parseInt(request.getParameter("review_star")));
				reviewBean.setReview_image(saveName);
				
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
