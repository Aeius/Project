package com.itwillbs.controller;

import java.security.Provider.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.CouponBean;
import com.itwillbs.domain.NoticeBean;
import com.itwillbs.domain.OrderBean;
import com.itwillbs.domain.OrderDetailBean;
import com.itwillbs.domain.ProductBean;
import com.itwillbs.domain.ReviewBean;
import com.itwillbs.service.AdminService;
import com.itwillbs.service.NoticeService;
import com.itwillbs.service.OrderDetailService;
import com.itwillbs.service.OrderService;
import com.itwillbs.service.ProductService;

@Controller
public class AdminController {

	@Inject
	private AdminService adminService;

	@Inject
	private OrderService orderService;

	@Inject
	private OrderDetailService orderDetailService;

	@Inject
	private ProductService productService;

	// ------------------ 상품등록 ---------------------
	// -> 아직 안됨 / 수업시간에 파일 등록 배운 뒤 적용 예정
	@RequestMapping(value = "/productAdd.ad", method = RequestMethod.GET)
	public String productAdd() {
		return "/AdminLTE-master/pages/productAdd";
	}

	@RequestMapping(value = "/productAddPro.ad", method = RequestMethod.POST)
	public String productAddPro(ProductBean productBean) {
		adminService.insertProduct(productBean);
		return "redirect:/productList.ad";
	}

	// ------------------ 상품목록 ---------------------
	@RequestMapping(value = "/productList.ad", method = RequestMethod.GET)
	public String productList(Model model) {
		ArrayList<ProductBean> allList = productService.getProductAllList();
		model.addAttribute("allList", allList);
		return "/AdminLTE-master/pages/productList";
	}

	// ------------------ 주문목록 ---------------------
	@RequestMapping(value = "/orderList.ad", method = RequestMethod.GET)
	public String orderList(Model model) {
		ArrayList<OrderBean> allList = orderService.getOrderAllList();
		model.addAttribute("allList", allList);
		return "/AdminLTE-master/pages/orderList";
		// insert into orderlist
		// values(null,'one@naver.com','홍길동','010-1234-1234',14243,'주소','무슨동','몇호',50000,0,0,'배송중','2021-07-22','무통장',5837573);
		// 'one@naver.com' 부분에는 본인 DB에 있는 회원아이디 넣어야 합니다!
	}

	// ------------------ 주문상세 ---------------------
	@RequestMapping(value = "/orderDetail.ad", method = RequestMethod.GET)
	public String orderDetail(Model model, HttpServletRequest request) {

		int order_idx = Integer.parseInt(request.getParameter("order_idx"));

		OrderBean orderBean = orderService.getOrderDetail(order_idx);
		ArrayList<OrderDetailBean> orderProductList = orderDetailService.getOrderProductList(order_idx);

		ArrayList<ProductBean> orderProductInfo = new ArrayList<ProductBean>(); // 상품 정보를 저장할 리스트
		for (OrderDetailBean bean : orderProductList) {
			ProductBean productBean = productService.view(bean.getOrder_detail_product_idx()); // 상품 정보 받아오기
			orderProductInfo.add(productBean); // 리스트에 추가
		}

		model.addAttribute("orderBean", orderBean);
		model.addAttribute("orderProductList", orderProductList);
		model.addAttribute("orderProductInfo", orderProductInfo);

		return "/AdminLTE-master/pages/orderDetail";
	}

	// ------------------ 주문 상태 변경 ---------------------
	@RequestMapping(value = "/orderStatusChange.ad", method = RequestMethod.POST)
	public String orderStatusChange(HttpServletRequest request) {

		int order_idx = Integer.parseInt(request.getParameter("idx"));
		String order_status = request.getParameter("status");

		OrderBean orderBean = orderService.getOrderInfo(order_idx);
		orderBean.setOrder_status(order_status);
		if(order_status.equals("주문취소")) {
			orderService.sendEmail(orderBean); // 메일 발송
		}

		orderService.updateOrderStatus(orderBean);

		return "redirect:/orderList.ad";
	}

	// ------------------ 매출 조회 ---------------------
	@RequestMapping(value = "/chartList.ad", method = RequestMethod.GET)
	public String chartList(Model model) {
		ArrayList<ProductBean> allList = productService.getProductAllList();
		model.addAttribute("allList", allList);
		return "/AdminLTE-master/pages/chartList";
	}

	// ------------------ 매출 차트 ---------------------
	@RequestMapping(value = "/chart.ad", method = RequestMethod.GET)
	public String chart() {
		// 차트 아직 구현 안됨 (이동 확인용)
		return "/AdminLTE-master/pages/chart";
	}

	// ------------------ 공지사항 등록 ---------------------
	@RequestMapping(value = "/noticeWrite.ad", method = RequestMethod.GET)
	public String noticeWrite() {
		return "/AdminLTE-master/pages/noticeWrite";
	}

	@RequestMapping(value = "/noticeWritePro.ad", method = RequestMethod.POST)
	public String noticeWritePro(NoticeBean noticeBean) {
//		System.out.println(noticeBean.getNotice_name().toString());
//		System.out.println(noticeBean.getNotice_subject().toString());
//		System.out.println(noticeBean.getNotice_content().toString());

		adminService.insertNotice(noticeBean);
		return "redirect:/noticeList.ad";
	}
	// pages/noticeWrite.jsp -> input 태그 hidden 속성으로 notice_name = "관리자" 들어가 있습니다.

	// ------------------ 공지사항 목록 출력 ---------------------
	@RequestMapping(value = "/noticeList.ad", method = RequestMethod.GET)
	public String NoticeList(HttpSession session, Model model) {

		List<NoticeBean> nb = adminService.getNoticeList();
		model.addAttribute("NoticeList", nb);
		return "/AdminLTE-master/pages/noticeList";
	}

	// ------------------ 공지사항 삭제 ---------------------
	@RequestMapping(value = "/deleteNoticePro.ad", method = RequestMethod.GET)
	public String deleteNoticePro(HttpServletRequest request) {
		int notice_idx = Integer.parseInt(request.getParameter("notice_idx"));
		adminService.deleteNotice(notice_idx);
		return "redirect:/noticeList.ad";
	}

	// ------------------ 공지사항 상세 조회 및 수정(미완성) ---------------------
	@RequestMapping(value = "/noticeInfo.ad", method = RequestMethod.GET)
	public String noticeInfo(Model model, HttpServletRequest request) {

		int notice_idx = Integer.parseInt(request.getParameter("notice_idx"));
		NoticeBean nb = adminService.getNotice(notice_idx);
		model.addAttribute("nb", nb);
		// System.out.println(notice_idx);
		return "/AdminLTE-master/pages/noticeInfo";
	}

	@RequestMapping(value = "/noticeUpdate.ad", method = RequestMethod.POST)
	public String noticeUpdate(HttpServletRequest request) {
		int notice_idx = Integer.parseInt(request.getParameter("notice_idx"));
		NoticeBean nb = adminService.getNotice(notice_idx); // idx로 기존 정보 가져오기

		nb.setNotice_subject(request.getParameter("notice_subject")); // 수정된 제목
		nb.setNotice_content(request.getParameter("notice_content")); // 수정된 내용
//	      System.out.println(nb.getNotice_subject());
//	      System.out.println(nb.getNotice_content());

		adminService.noticeUpdate(nb);
		return "redirect:/noticeList.ad";
	}

	// ------------------ 리뷰 목록 출력 ---------------------
	@RequestMapping(value = "/reviewList.ad", method = RequestMethod.GET)
	public String reviewList(HttpSession session, Model model) {
		List<ReviewBean> review = adminService.getReviewList();
		model.addAttribute("review", review);
		return "/AdminLTE-master/pages/reviewList";
	}

	// ------------------ 리뷰 삭제 ------------------------
		@RequestMapping(value = "/deleteReview.ad", method = RequestMethod.GET)
		public String deleteReview(HttpServletRequest request) {
			int review_idx = Integer.parseInt(request.getParameter("review_idx"));
//			System.out.println(review_idx);
			adminService.deleteReview(review_idx);
			return "redirect:/reviewList.ad";
		}

	// ------------------ 쿠폰 목록 ------------------------
	@RequestMapping(value = "/couponList.ad", method = RequestMethod.GET)
	public String couponList(HttpServletRequest request, Model model) {
		List<CouponBean> coupon = adminService.getCouponList();
		model.addAttribute("coupon", coupon);
		return "/AdminLTE-master/pages/couponList";
	}
	
	
}






