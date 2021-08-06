package com.itwillbs.controller;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.CouponBean;
import com.itwillbs.domain.MemberBean;
import com.itwillbs.domain.OrderDetailBean;
import com.itwillbs.domain.OrderListBean;
import com.itwillbs.domain.ProductBean;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.OrderDetailService;
import com.itwillbs.service.OrderListService;
import com.itwillbs.service.ProductService;

@Controller
public class PayController {

	@Inject
	private OrderListService orderListService;
	
	@Inject
	private OrderDetailService orderDetailService;
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private ProductService productService;
	
	// ---------------------------- 결제 창으로 이동 --------------------------------------------
	@RequestMapping(value = "/checkout.sh", method = RequestMethod.POST)
	public String checkout(HttpServletRequest request , Model model, HttpSession session) {
		String email = (String)session.getAttribute("member_email");
		MemberBean memberBean = memberService.getMember(email);
		
		String[] product_idx = request.getParameterValues("product_idx");
		String[] product_price = request.getParameterValues("product_price");
		String[] product_name = request.getParameterValues("product_name");
		String[] basket_quantity = request.getParameterValues("basket_quantity");
//		String[] selectedCoupon_idx = request.getParameterValues("selectedCoupon_idx");
//		String[] selectedCoupon_name = request.getParameterValues("selectedCoupon_name");
		
		
		ArrayList<ProductBean> productList = new ArrayList<ProductBean>();
		
		for(int i = 0; i < product_idx.length; i++) {
			ProductBean pb = new ProductBean();
			pb.setProduct_idx(Integer.parseInt(product_idx[i]));
			pb.setProduct_price(Integer.parseInt(product_price[i]));
			pb.setProduct_name(product_name[i]);
			pb.setProduct_quantity(basket_quantity[i]);
			
			productList.add(pb);
			
		}
//		
//		ArrayList<CouponBean> couponList = new ArrayList<CouponBean>();
//		
//		for(int i = 0; i < selectedCoupon_idx.length; i++) {
//			CouponBean cb = new CouponBean();
//			cb.setCoupon_idx(Integer.parseInt(selectedCoupon_idx[i]));
//			cb.setCoupon_name((selectedCoupon_name[i]));
//			
//			couponList.add(cb);
//			
//		}
		
		model.addAttribute("member", memberBean);
		model.addAttribute("productList", productList);
//		model.addAttribute("couponList", couponList);
//		model.addAttribute("amount", request.getParameter("amount")); 
		// => amount는 결제페이지 화면에서 jstl로 계산하니까 안받아와도 되지않을까요?
		
		return "/dailyShop/member/checkout";
	}
	
	
	//---------------------------- 결제 완료 후 결제 데이터 저장 --------------------------------
	@RequestMapping(value = "/checkout_finish.sh", method = RequestMethod.POST)
	public String checkout_finish(HttpServletRequest request , Model model) {
		System.out.println("checkout_finish()");
		
		
//		insert into orderlist
//		set
//		order_idx = #{order_idx},
//		order_member_email = #{order_member_email},
//		order_receiver_name = #{order_receiver_name},
//		order_receiver_phone = #{order_receiver_phone},
//		order_receiver_post = #{order_receiver_post},
//		order_receiver_address = #{order_receiver_address},
//		order_receiver_extraAddress = #{order_receiver_extraAddress},
//		order_receiver_extraAddress2 = #{order_receiver_extraAddress2},
//		order_amount = #{order_amount},
//		order_coupon = #{order_coupon},
//		order_point = #{order_point},
//		order_status = #{order_status}
		
		System.out.println("주문번호 : " + request.getParameter("order_idx").substring(5));
		System.out.println("주문자 이메일 : " + request.getParameter("buyer_email"));
		System.out.println("주문자 연락처 : " + request.getParameter("buyer_tel"));
		System.out.println("주문자 우편번호 : " + request.getParameter("member_post"));
		System.out.println("주문자 주소 : " + request.getParameter("member_address"));
		System.out.println("주문자 주소2 : " + request.getParameter("member_extraAddress"));
		System.out.println("주문자 주소3 : " + request.getParameter("member_extraAddress2"));
		System.out.println("쿠폰 : " + request.getParameter("coupon"));
		System.out.println("포인트  : " + request.getParameter("point"));
		System.out.println("결제 금액 : " + request.getParameter("amount"));
		
		
		System.out.println("주문한 상품 : " + request.getParameter("product_idx"));
		System.out.println("주문상품의 갯수 : " + request.getParameter("product_quantity"));
		
		int order_idx = Integer.parseInt(request.getParameter("order_idx").substring(5));
		String member_email = request.getParameter("buyer_email");
		
		// orderlist 에 저장할 데이터들 bean 에 담기
		OrderListBean orderListBean = new OrderListBean();
		orderListBean.setOrder_idx(order_idx);
		orderListBean.setOrder_member_email(member_email);
		orderListBean.setOrder_receiver_name(request.getParameter("buyer_name"));
		orderListBean.setOrder_receiver_phone(request.getParameter("buyer_tel"));
		orderListBean.setOrder_receiver_post(request.getParameter("member_post"));
		orderListBean.setOrder_receiver_address(request.getParameter("member_address"));
		orderListBean.setOrder_receiver_extraAddress(request.getParameter("member_extraAddress"));
		orderListBean.setOrder_receiver_extraAddress2(request.getParameter("member_extraAddress2"));
		orderListBean.setOrder_coupon(Integer.parseInt(request.getParameter("coupon")));
		orderListBean.setOrder_point(request.getParameter("point"));
		orderListBean.setOrder_amount(Integer.parseInt(request.getParameter("amount")) - Integer.parseInt(request.getParameter("point")));
		orderListBean.setOrder_status("결제완료");
//		orderListBean.setOrder_date(); // mapper에서 now() 사용
		orderListBean.setOrder_payment("kakaopay");
		orderListBean.setOrder_tracking_num(order_idx);
		
		
		orderListService.insertOrderList(orderListBean); // orderlist 생성
		System.out.println("insertOrderList - 성공!");
		
		String[] products = request.getParameterValues("product_idx"); // 상품 정보들 가져오기
		String[] quantitys = request.getParameterValues("product_quantity"); // 선택한 상품들의 수량 가져오기
		
		
		// 반복문을 통해 order_detail에 각 상품 등록
		for(int i = 0; i < products.length; i++) {
			OrderDetailBean orderDetailBean = new OrderDetailBean();
			orderDetailBean.setOrder_detail_order_idx(order_idx);
			orderDetailBean.setOrder_detail_product_idx(Integer.parseInt(products[i]));
			orderDetailBean.setOrder_detail_product_quantity(Integer.parseInt(quantitys[i]));
			orderDetailBean.setOrder_detail_return_check(" ");
			
			orderDetailService.insertOrderDetail(orderDetailBean); // orderdetail 추가 
			System.out.println("insertOrderDetail - 수행완료");
			productService.updateSellcount(products[i]); // sellcount 증가
			System.out.println("updateSellcount - 수행완료");
			
			
		}
		CouponBean couponBean = new CouponBean();
		couponBean.setCoupon_email(member_email);
		couponBean.setCoupon_idx(Integer.parseInt(request.getParameter("coupon")));
		memberService.updateCoupon(couponBean); // 쿠폰 사용 처리
		
		MemberBean memberBean = new MemberBean();
		memberBean.setMember_email(member_email);
		if(Integer.parseInt(request.getParameter("point")) == 0) { // 포인트를 사용하지 않을 경우
			memberBean.setMember_point(Integer.parseInt(request.getParameter("amount")) / 100);
			memberService.addPoint(memberBean); // 포인트 적립
		} else {
			memberBean.setMember_point(Integer.parseInt(request.getParameter("point")));
			memberService.usePoint(memberBean); // 포인트 사용 처리
		}
		
		model.addAttribute("order_idx", order_idx);
		
		return "/dailyShop/member/checkout_finish";
	}

	
	
}
