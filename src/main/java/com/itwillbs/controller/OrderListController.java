package com.itwillbs.controller;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.MemberBean;
import com.itwillbs.domain.OrderBean;
import com.itwillbs.domain.OrderListBean;
import com.itwillbs.domain.PageBean;
import com.itwillbs.domain.ReviewBean;
import com.itwillbs.domain.WishListBean;
import com.itwillbs.service.OrderListService;
import com.itwillbs.service.OrderService;



@Controller
public class OrderListController {
	
	@Inject
	private OrderListService orderListService;
	
	
	//-------------------------------------------------------------- 주문내역 리스트 --------------------------------------------------------
	@RequestMapping(value = "/orderList.sh", method = RequestMethod.GET)
	public String orderList(HttpSession session, Model model, HttpServletRequest request) {
		String order_member_email = (String)session.getAttribute("member_email");
//		String review_email = order_member_email;

		// member 정보 전체를 조회
//		ArrayList<OrderListBean> orderList = orderListService.getOrderList(order_member_email);
		
		//PageBean 객체생성
				PageBean pb=new PageBean();
//				pageNum pageSize 조합해서 시작하는 행번호 구하기
				String pageNum=request.getParameter("pageNum");
				if(pageNum==null) {
					// pageNum 없으면 1페이지
					pageNum="1";
				}
		
				pb.setOrder_member_email(order_member_email);
				
				pb.setPageNum(pageNum);
				
				//한화면에 보여줄 글개수
				int pageSize=10;
				pb.setPageSize(pageSize);
				
				// 게시판 글 가져오기 (시작하는 행번호에서 몇개 )
				pb.setCount(orderListService.getOrderListCount(order_member_email));
				
				// .getReview
				// SELECT review_idx, review_product_idx FROM review where review_member_email = #{member_email};
				// List result = reviewService.getReview(member_email);
				// 리뷰 테이블 조회 시 member_email 값 줌으로써 내 리뷰들만 조회
				// 1   1
				// 2   1
				// 3   2
				// 4   3
				//이런식으로 출력됨
				
				
				// 해당 리뷰들의 review_product_idx 를 통해 product 정보들 가져오기
				// .getProduct
				// SELECT product_name, product_price from product, review where product_idx = #{review_product_idx};
				// ProductBean pb = productService.getProduct(result.getReview_product_idx());
				
				
				// ReviewBean rb = new ReviewBean();
				// rb.setReview_idx(result.getReview_idx())
				
				
				
				ArrayList<OrderListBean> orderList = orderListService.getOrderListPage(pb);
				
				for(OrderListBean o  : orderList) {
					System.out.println(o.getOrder_idx());
				}
				
				
			    System.out.println(order_member_email);
  
//				System.out.println(pb.getCurrentPage());
//				System.out.println(pb.getPageCount());
//				System.out.println(pb.getEndPage());
//				System.out.println(pb.getEndRow());
//				System.out.println(pb.getPageNum());
//				System.out.println(pb.getPageBlock());
//				System.out.println(pb.getPageSize());
				
//				OrderListBean reviewFind = orderListService.getReviewFind(review_email);
//				System.out.println(reviewFind.getReview_idx());
//				
//				
////				reviewFind.getReview_idx();
//				int review_idx = reviewFind.getReview_idx();
//				System.out.println(review_idx);
//				OrderListBean reviewCheck = orderListService.getReviewCheck(review_email, review_idx);
//				
//				OrderListBean reviewCheck = orderListService.getReviewCheck1(review_idx);
				
//				System.out.println(reviewCheck.getReview_idx());
				
			// 전체 글개수 구하기 (PageBean에 저장시 페이지 관련 정보 계산)
			
			System.out.println(pb.getOrder_member_email());
			System.out.println(pb.getCount());
			
			// 리뷰 정보 가져가기
//			model.addAttribute("reviewCheck" , reviewCheck);
			
			//Model 데이터 담아 가기
			model.addAttribute("orderList" , orderList);
			// 페이지 총 개수 가져 가기
			model.addAttribute("pb",pb);
		
		return "/dailyShop/member/orderList";
	}
	
	//-------------------------------------------------------------- 반품신청 --------------------------------------------------------
	@RequestMapping(value = "/orderReturn.sh", method = RequestMethod.GET)
	public String orderReturn(@RequestParam("order_idx") int order_idx,Model model) {	
		System.out.println(order_idx);

		OrderListBean orederBListBean = orderListService.getOrderMember(order_idx);
		orederBListBean.setOrder_status("반품신청");
		orderListService.updateOrder(orederBListBean);
		//  /member/main 가상주소 이동
		return "redirect:orderList.sh";

	}
	
}
