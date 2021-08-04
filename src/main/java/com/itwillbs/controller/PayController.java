package com.itwillbs.controller;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		
		ArrayList<ProductBean> productList = new ArrayList<ProductBean>();
		
		for(int i = 0; i < product_idx.length; i++) {
			ProductBean pb = new ProductBean();
			pb.setProduct_idx(Integer.parseInt(product_idx[i]));
			pb.setProduct_price(Integer.parseInt(product_price[i]));
			pb.setProduct_name(product_name[i]);
			pb.setProduct_quantity(basket_quantity[i]);
			
			productList.add(pb);
			
		}
		
		model.addAttribute("member", memberBean);
		model.addAttribute("productList", productList);
		model.addAttribute("amount", request.getParameter("amount"));
		
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
		System.out.println("주문자 주소 : " + request.getParameter("roadAddress"));
		System.out.println("주문자 주소2 : " + request.getParameter("detailAddress"));
		System.out.println("주문자 주소3 : " + request.getParameter("detailAddress"));
		System.out.println("주문자 우편번호 : " + request.getParameter("postcode"));
		System.out.println("쿠폰 : " + request.getParameter("coupon"));
		System.out.println("포인트  : " + request.getParameter("point"));
		System.out.println("결제 금액 : " + request.getParameter("amount"));
		
		
		System.out.println("주문한 상품 : " + request.getParameter("product_idx"));
		System.out.println("주문상품의 갯수 : " + request.getParameter("basket_quantity"));
		
		int order_idx = Integer.parseInt(request.getParameter("order_idx").substring(5));
		
		// orderlist 에 저장할 데이터들 bean 에 담기
		OrderListBean orderListBean = new OrderListBean();
		orderListBean.setOrder_idx(order_idx);
		orderListBean.setOrder_member_email(request.getParameter("buyer_email"));
		orderListBean.setOrder_receiver_name(request.getParameter("buyer_name"));
		orderListBean.setOrder_receiver_phone(request.getParameter("buyer_tel"));
		orderListBean.setOrder_receiver_post(request.getParameter("postcode"));
		orderListBean.setOrder_receiver_address(request.getParameter("roadAddress"));
		orderListBean.setOrder_receiver_extraAddress(request.getParameter("detailAddress"));
		orderListBean.setOrder_receiver_extraAddress2(request.getParameter("buyer_extraAddr2"));
		orderListBean.setOrder_coupon(request.getParameter("coupon"));
		orderListBean.setOrder_point(request.getParameter("point"));
		orderListBean.setOrder_amount(Integer.parseInt(request.getParameter("amount")));
		
		
		orderListService.insertOrderList(orderListBean); // orderlist 생성
		
		String products = request.getParameter("product_idx"); // 상품 정보들 가져오기
		String quantitys = request.getParameter("product_quantity"); // 선택한 상품들의 수량 가져오기
		
		// 각각의 상품과 상품갯수 분리하여 배열에 저장
		String[] product = products.split("/");
		String[] quantity = quantitys.split("/");
		
		// 반복문을 통해 order_detail에 각 상품 등록
		for(int i = 0; i < product.length; i++) {
			OrderDetailBean orderDetailBean = new OrderDetailBean();
			orderDetailBean.setOrder_detail_order_idx(order_idx);
			orderDetailBean.setOrder_detail_product_idx(Integer.parseInt(product[i]));
			orderDetailBean.setOrder_detail_product_quantity(Integer.parseInt(quantity[i]));
			orderDetailService.insertOrderDetail(orderDetailBean);
			
			productService.updateSellcount(product[i]);
//			memberService.updateCoupon(member_email, coupon)
//			memberService.updatePoint(member_email, point)
			
			
		}
		
		model.addAttribute("order_idx", request.getParameter("order_idx"));
		
		return "/dailyShop/member/checkout_finish";
	}

	
	
}
