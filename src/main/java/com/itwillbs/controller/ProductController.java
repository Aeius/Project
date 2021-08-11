package com.itwillbs.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.MemberBean;
import com.itwillbs.domain.PageBean;
import com.itwillbs.domain.ProductBean;
import com.itwillbs.domain.ReviewBean;
import com.itwillbs.domain.WishListBean;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.ProductService;
import com.itwillbs.service.ReviewService;
import com.itwillbs.service.WishListService;

@Controller
public class ProductController {
	
	@Inject
	private ProductService productService;
	
	@Inject 
	private WishListService wishListService;
	
	@Inject
	private ReviewService reviewService;

//	가상주소  http://localhost:8080/myweb2/member/insert
	
	//-------------------------------------------------------------- 30ml 상품 리스트 --------------------------------------------------------
	@RequestMapping(value = "/productList.sh", method = RequestMethod.GET)
	public String list30(HttpSession session, Model model, HttpServletRequest request) {
		
		// 각 상품에 따른 좋아요 여부 체크
		ArrayList<WishListBean> checkHeart = null;
		if(session.getAttribute("member_email") != null){
			String member_email = (String)session.getAttribute("member_email");
			checkHeart = wishListService.checkHeart(member_email);
		}
		
//		for(WishListBean o : checkHeart) {
//			System.out.println("product_idx -" + o.getWishList_product_idx());
//		}
//		
		model.addAttribute("checkHeart" ,checkHeart);
		
		// 파우더리 / 플로럴 / 우디 / 아쿠아 / 프루티 / 시트러스 / 스파이시 / 모던
		// powdery / floral / woody / aqua / fruity / sitrus / spices / modern
		// product의 정보 전체를 조회
		ArrayList<ProductBean> allList = productService.getProductAllList30();
		ArrayList<ProductBean> powderyList = productService.getProductPowderyList();
		ArrayList<ProductBean> floralList = productService.getProductFloralList();
		ArrayList<ProductBean> woodyList = productService.getProductWoodyList();
		ArrayList<ProductBean> aquaList = productService.getProductAquaList();
		ArrayList<ProductBean> fruityList = productService.getProductFruityList();
		ArrayList<ProductBean> sitrusList = productService.getProductSitrusList();
		ArrayList<ProductBean> spicesList = productService.getProductSpicesList();
		ArrayList<ProductBean> modernList = productService.getProductModernList();
		
		//Model mb.mb 데이터 담아 가기
		model.addAttribute("allList" , allList);
		model.addAttribute("powderyList" , powderyList);
		model.addAttribute("floralList" , floralList);
		model.addAttribute("woodyList" , woodyList);
		model.addAttribute("aquaList" , aquaList);
		model.addAttribute("fruityList" , fruityList);
		model.addAttribute("sitrusList" , sitrusList);
		model.addAttribute("spicesList" , spicesList);
		model.addAttribute("modernList" , modernList);
		
		return "/dailyShop/product_board/product";
	}
	
	//-------------------------------------------------------------- 50ml 상품 리스트 --------------------------------------------------------
		@RequestMapping(value = "/productList50.sh", method = RequestMethod.GET)
		public String list50(HttpSession session, Model model, HttpServletRequest request) {
			
			// 각 상품에 따른 좋아요 여부 체크
			ArrayList<WishListBean> checkHeart = null;
			if(session.getAttribute("member_email") != null){
				String member_email = (String)session.getAttribute("member_email");
				checkHeart = wishListService.checkHeart(member_email);
			}
			
//			for(WishListBean o : checkHeart) {
//				System.out.println("product_idx -" + o.getWishList_product_idx());
//			}
//			
			model.addAttribute("checkHeart" ,checkHeart);
			
			// 파우더리 / 플로럴 / 우디 / 아쿠아 / 프루티 / 시트러스 / 스파이시 / 모던
			// powdery / floral / woody / aqua / fruity / sitrus / spices / modern
			// product의 정보 전체를 조회
			ArrayList<ProductBean> allList = productService.getProductAllList50();
			ArrayList<ProductBean> powderyList = productService.getProductPowderyList50();
			ArrayList<ProductBean> floralList = productService.getProductFloralList50();
			ArrayList<ProductBean> woodyList = productService.getProductWoodyList50();
			ArrayList<ProductBean> aquaList = productService.getProductAquaList50();
			ArrayList<ProductBean> fruityList = productService.getProductFruityList50();
			ArrayList<ProductBean> sitrusList = productService.getProductSitrusList50();
			ArrayList<ProductBean> spicesList = productService.getProductSpicesList50();
			ArrayList<ProductBean> modernList = productService.getProductModernList50();
			//Model mb.mb 데이터 담아 가기
			model.addAttribute("allList" , allList);
			model.addAttribute("powderyList" , powderyList);
			model.addAttribute("floralList" , floralList);
			model.addAttribute("woodyList" , woodyList);
			model.addAttribute("aquaList" , aquaList);
			model.addAttribute("fruityList" , fruityList);
			model.addAttribute("sitrusList" , sitrusList);
			model.addAttribute("spicesList" , spicesList);
			model.addAttribute("modernList" , modernList);
			
			return "/dailyShop/product_board/product50ml";
		}
	//-------------------------------------------------------------- 검색 기능 -----------------------------------------------------------
		@RequestMapping(value = "/search.sh", method = RequestMethod.GET)
		public String search(HttpServletRequest request, Model model, HttpSession session) {
			
			// 각 상품에 따른 좋아요 여부 체크
			ArrayList<WishListBean> checkHeart = null;
			if(session.getAttribute("member_email") != null){
				String member_email = (String)session.getAttribute("member_email");
				checkHeart = wishListService.checkHeart(member_email);
			}
			
//			for(WishListBean o : checkHeart) {
//				System.out.println("product_idx -" + o.getWishList_product_idx());
//			}
//			
			model.addAttribute("checkHeart" ,checkHeart);
			
			String search = request.getParameter("search");
			// member 정보 전체를 조회
			ArrayList<ProductBean> searchList = productService.getProductSearchList(search);
			//Model mb.mb 데이터 담아 가기
			model.addAttribute("search" , searchList);
			
			//  /WEB-INF/views/member/info.jsp 이동
			
			return "/dailyShop/product_board/search";
		}
	
	//-------------------------------------------------------------- 상품 상세 페이지 --------------------------------------------------------
	@RequestMapping(value = "/productDetail.sh", method = RequestMethod.GET)
	public String getProductInfo(@RequestParam("product_idx") int product_idx, Model model, HttpSession session, HttpServletRequest request) {
		ProductBean productBean = productService.getProductInfo(product_idx);
		WishListBean wishListBean = new WishListBean();
		wishListBean.setProduct_idx(product_idx);
		wishListBean.setWishList_member_email((String)session.getAttribute("member_email"));
		WishListBean wl = wishListService.checkWishList(wishListBean);
		String member_email = (String) session.getAttribute("member_email");
		
		PageBean pb=new PageBean();
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
		ArrayList<ReviewBean> reviewList = reviewService.getProductReview(Integer.parseInt(request.getParameter("product_idx")));
		model.addAttribute("reviewList", reviewList);
		
		// 상품정보를 담아 전달
		model.addAttribute("productBean", productBean);
		// 좋아요 여부 확인
		model.addAttribute("wl", wl);
//		model.addAttribute("pb",pb);
		
		return "/dailyShop/product_board/product-detail";
		
	}
	
	
	
}
