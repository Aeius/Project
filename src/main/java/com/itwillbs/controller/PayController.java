package com.itwillbs.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.util.BufferRecycler;
import com.fasterxml.jackson.core.util.JsonParserDelegate;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.itwillbs.domain.MemberBean;
import com.itwillbs.domain.OrderBean;
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
		
		System.out.println("주문번호 : " + request.getParameter("order_idx"));
		System.out.println("주문자 이메일 : " + request.getParameter("buyer_email"));
		System.out.println("주문자 연락처 : " + request.getParameter("buyer_tel"));
		System.out.println("주문자 주소 : " + request.getParameter("buyer_addr"));
		System.out.println("주문자 주소2 : " + request.getParameter("buyer_extraAddr"));
		System.out.println("주문자 주소3 : " + request.getParameter("buyer_extraAddr2"));
		System.out.println("주문자 우편번호 : " + request.getParameter("buyer_postcode"));
		System.out.println("결제 금액 : " + request.getParameter("amount"));
		
		System.out.println("주문한 상품 : " + request.getParameter("product_idx"));
		System.out.println("주문상품의 갯수 : " + request.getParameter("product_quantity"));
		
		// orderlist 에 저장할 데이터들 bean 에 담기
		OrderListBean orderListBean = new OrderListBean();
		orderListBean.setOrder_idx(Integer.parseInt(request.getParameter("order_idx")));
		orderListBean.setOrder_member_email(request.getParameter("buyer_email"));
		orderListBean.setOrder_receiver_name(request.getParameter("buyer_name"));
		orderListBean.setOrder_receiver_phone(request.getParameter("buyer_tel"));
		orderListBean.setOrder_receiver_post(request.getParameter("buyer_postcode"));
		orderListBean.setOrder_receiver_address(request.getParameter("buyer_addr"));
		orderListBean.setOrder_receiver_extraAddress(request.getParameter("buyer_extraAddr"));
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
			orderDetailBean.setOrder_detail_order_idx(Integer.parseInt(request.getParameter("order_idx")));
			orderDetailBean.setOrder_detail_product_idx(Integer.parseInt(product[i]));
			orderDetailBean.setOrder_detail_product_quantity(Integer.parseInt(quantity[i]));
			orderDetailService.insertOrderDetail(orderDetailBean);
			
		}
		
		
		return "/dailyShop/member/checkout_finish";
	}

	
	
}
