package com.itwillbs.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itwillbs.domain.PageBean;
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
	public String review(@RequestParam("product_idx") int product_idx, @RequestParam("order_idx")int order_idx, HttpSession session, Model model) {
		String review_email = (String)session.getAttribute("member_email");
		System.out.println(review_email);
		System.out.println(product_idx);
		System.out.println(order_idx);
		model.addAttribute("review_email", review_email);
		model.addAttribute("product_idx", product_idx);
		model.addAttribute("order_idx", order_idx);
		return "/dailyShop/member/reviewForm";
	}

// -----------------------------------리뷰 등록 처리---------------------------------------------------
	@RequestMapping(value = "/reviewWritePro.sh", method = RequestMethod.POST)
	public String reviewWritePro(MultipartHttpServletRequest  request,int review_order_idx, @RequestParam("review_image") MultipartFile[] file, HttpServletResponse response ) throws Exception{
		// 여러 파일 MultipartHttpServletRequest, @RequestParam MultipartFile[] 배열
			
//		System.out.println(reviewBean.getReview_email());
//		System.out.println(reviewBean.getReview_star());
//		System.out.println(reviewBean.getReview_product_idx());
//		System.out.println(reviewBean.getReview_content());
		// 랜덤문자열 생성  랜덤문자열_파일이름
		UUID uid = UUID.randomUUID(); // 랜덤문자열
		String saveName = ""; // upload 폴더에 저장되는 파일명
		System.out.println(saveName);
		
		ReviewBean reviewBean=new ReviewBean();
		reviewBean.setReview_product_idx(Integer.parseInt(request.getParameter("review_product_idx")));
		reviewBean.setReview_email(request.getParameter("review_email"));
		reviewBean.setReview_subject(request.getParameter("review_subject"));
		reviewBean.setReview_content(request.getParameter("review_content"));
		reviewBean.setReview_star(Integer.parseInt(request.getParameter("review_star")));
		reviewBean.setReview_order_idx(Integer.parseInt(request.getParameter("review_order_idx")));
		
		System.out.println(file.length);
		System.out.println(reviewBean.getReview_image());
		System.out.println(file.length);
		
		// 파일 담기
		for(int i=0; i<file.length; i++) { // 파일 갯수만큼 반복
			// 저장되는 파일명 = 랜덤문자열_원래파일이름 => 같은 상품은 같은 랜덤문자열 
													//=> for문 안에서 UUID 선언시 각 파일마다 랜덤문자열 달라짐
		saveName = uid.toString() + "_" + file[i].getOriginalFilename(); 

			// upload 폴더로 복사 => webapp > resources > upload 폴더 있어야함
			File target = new File(uploadPath, saveName);
			FileCopyUtils.copy(file[i].getBytes(), target);

			// jsp 파일 폼 태그 순서대로 저장됨
			if(i==0) { // 첫번째 파일 = 첫번째 이미지
				reviewBean.setReview_image(saveName);
			} else if(i==1) { // 두번째파일 = 두번째 이미지
				reviewBean.setReview_image2(saveName);
			}
		}

		reviewService.insertReview(reviewBean);
	
		return "/dailyShop/member/reviewPop";
	}
// -----------------------------------리뷰 수정---------------------------------------------------	
	@RequestMapping(value = "/reviewUpdateForm.sh", method = RequestMethod.GET)
	public String reviewUpdate(@RequestParam("review_idx") int review_idx,Model model) {
		
		System.out.println(review_idx);
		ReviewBean reviewBean = reviewService.getReview(review_idx);
		// 평점 별 개수 map에 저장해서 가져가는 부분
		Map ratingOptions = new HashMap();
		ratingOptions.put(0, "☆☆☆☆☆");
		ratingOptions.put(1, "★☆☆☆☆");
		ratingOptions.put(2, "★★☆☆☆");
		ratingOptions.put(3, "★★★☆☆");
		ratingOptions.put(4, "★★★★☆");
		ratingOptions.put(5, "★★★★★");

		//Model 데이터 담아 가기
		// 평점 별모양 정보 가져가기
		model.addAttribute("ratingOptions", ratingOptions);

		System.out.println(reviewBean.getReview_star());
		model.addAttribute("reviewBean", reviewBean);
		
		return "/dailyShop/member/reviewUpdateForm";
	}
	
	@RequestMapping(value = "/reviewUpdatePro.sh", method = RequestMethod.POST)
	public String reviewUpdatePro(Model model, MultipartHttpServletRequest request, @RequestParam MultipartFile[] file, @RequestParam("review_idx") int review_idx,HttpServletResponse response) throws Exception{
		// 랜덤문자열 생성  랜덤문자열_파일이름
				
//				UUID uid = UUID.randomUUID(); // 랜덤문자열
//				String saveName = ""; // upload 폴더에 저장되는 파일명
//				System.out.println(saveName);
//				System.out.println(request.getParameter("review_idx"));

				ReviewBean reviewBean = reviewService.getReview(review_idx);
//				int original_review_star = reviewBean.getReview_star();
//				System.out.println(original_review_star);
				reviewBean.setReview_idx(Integer.parseInt(request.getParameter("review_idx")));
				reviewBean.setReview_email(request.getParameter("review_email"));
				reviewBean.setReview_subject(request.getParameter("review_subject"));
				reviewBean.setReview_content(request.getParameter("review_content"));
				reviewBean.setReview_star(Integer.parseInt(request.getParameter("review_star")));
				
				
//				// 리뷰 평점 기존 값과 수정 값 비교
//				int update_review_star = reviewBean.getReview_star();
//				System.out.println(update_review_star);
//				if(original_review_star == update_review_star) {
//					reviewBean.setReview_star(original_review_star);
//				}else {
//					reviewBean.setReview_star(update_review_star);
//				}
				
//				System.out.println(reviewBean.getReview_image());
//				System.out.println(reviewBean.getReview_image2());
				
//				System.out.println(Integer.parseInt(request.getParameter("review_idx")));
//				System.out.println(file.length);
//				System.out.println(file.length);
				
				// 파일 담기
				UUID uid=UUID.randomUUID();
				String saveName = "";
				for (int i = 0; i < file.length; i++) {
					if (file[i].getOriginalFilename() == "") { // 파일 미선택시
						continue; // 변경안하고 넘어감 (기존 파일 유지)
					} else { // 파일 선택시
						saveName = uid.toString() + "_" + file[i].getOriginalFilename();
						File target = new File(uploadPath, saveName);
						FileCopyUtils.copy(file[i].getBytes(), target);
						if (i == 0) { // 첫번째 파일 = 메인 이미지
							reviewBean.setReview_image(saveName);
							System.out.println(reviewBean.getReview_image());
						} else if (i == 1) { // 두번째파일 = 디테일 이미지
							reviewBean.setReview_image2(saveName);
							System.out.println(reviewBean.getReview_image2());
						}
					}
				}
				
		reviewService.updateReview(reviewBean);
		model.addAttribute("reviewBean", reviewBean);
		
		return "/dailyShop/member/reviewUpdatePop";
	}
	
	// -----------------------------------리뷰 삭제---------------------------------------------------		
	@RequestMapping(value = "/reviewDeletePro.sh", method = RequestMethod.GET)
	public String reviewDeltePro(@RequestParam("review_idx") int review_idx, Model model,HttpSession session, HttpServletResponse response) {
		
		System.out.println(review_idx);
		reviewService.deleteReview(review_idx);
		
		response.setContentType("text/html; charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			out.println("<script> "
					+ "alert('리뷰 삭제 완료');"
					+ "</script>");
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/reviewList.sh";
	}
	
// -----------------------------------내 리뷰 리스트---------------------------------------------------
	
	@RequestMapping(value = "/reviewList.sh", method = RequestMethod.GET)
	public String ReviewList(HttpSession session, Model model, HttpServletRequest request){
		//PageBean 객체생성
		PageBean pb=new PageBean();
		String member_email = (String) session.getAttribute("member_email");
		pb.setMember_email(member_email);
//		pageNum pageSize 조합해서 시작하는 행번호 구하기
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			// pageNum 없으면 1페이지
			pageNum="1";
		}
		pb.setPageNum(pageNum);
		
		//한화면에 보여줄 글개수
		int pageSize=10;
		pb.setPageSize(pageSize);
		
		// 게시판 글 가져오기 (시작하는 행번호에서 몇개 )
		ArrayList<ReviewBean> reviewList = reviewService.getReviewListPage(pb);
		
		// 전체 글개수 구하기 (PageBean에 저장시 페이지 관련 정보 계산)
		pb.setCount(reviewService.getReviewListCount(member_email));
		
//		String review_email = (String)session.getAttribute("member_email");
//		System.out.println(review_email);
		// member 정보 전체를 조회
//		ArrayList<ReviewBean> reviewList = reviewService.getReviewList(review_email);
		
	
		
		// 평점 별 개수 map에 저장해서 가져가는 부분
		Map ratingOptions = new HashMap();
		ratingOptions.put(0, "☆☆☆☆☆");
		ratingOptions.put(1, "★☆☆☆☆");
		ratingOptions.put(2, "★★☆☆☆");
		ratingOptions.put(3, "★★★☆☆");
		ratingOptions.put(4, "★★★★☆");
		ratingOptions.put(5, "★★★★★");
		
		//Model 데이터 담아 가기
		// 평점 별모양 정보 가져가기
		model.addAttribute("ratingOptions", ratingOptions);
		// 페이지 정보, 리뷰 정보 가져 가기
		model.addAttribute("reviewList" , reviewList);
		model.addAttribute("pb",pb);
		
		return "/dailyShop/member/myReview";
	}
	
	

}

