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
//	
//	@RequestMapping(value = "/checkout2.sh", method = RequestMethod.GET)
//	public String checkout(HttpServletRequest request , Model model) {
//		
//		int product_idx = Integer.parseInt(request.getParameter("product_idx"));
//		ProductBean product = productService.getProductInfo(product_idx);
//		
//		String member_email = request.getParameter("member_email");
//		MemberBean member = memberService.getMember(member_email);
//		
//		model.addAttribute("product", product);
//		model.addAttribute("member", member);
//		
//		return "/dailyShop/member/checkout";
//	}

	@RequestMapping(value = "/checkout_finish.sh", method = RequestMethod.POST)
	public String checkout_finish(HttpServletRequest request , Model model) {
		System.out.println("checkout_finish()");
		
//		document.getElementById('order_idx').value = 'p' + new Date().getTime(),
//				document.getElementById('buyer_email').value = rsp.buyer_email;
//		        document.getElementById('buyer_tel').value = rsp.buyer_tel;
//		        document.getElementById('buyer_addr').value = rsp.buyer_addr;
//		        document.getElementById('buyer_postcode').value = rsp.buyer_postcode;
//		        document.getElementById('amount').value = rsp.paid_amount;
		
		System.out.println("결제 금액 : " + request.getParameter("amount"));
		System.out.println("주문번호 : " + request.getParameter("order_idx"));
		System.out.println("주문자 이메일 : " + request.getParameter("buyer_email"));
		System.out.println("주문자 연락처 : " + request.getParameter("buyer_tel"));
		System.out.println("주문자 주소 : " + request.getParameter("buyer_addr"));
		System.out.println("주문자 우편번호 : " + request.getParameter("buyer_postcode"));
		System.out.println("주문한 상품 : " + request.getParameter("product_idx"));
		System.out.println("주문상품의 갯수 : " + request.getParameter("product_quantity"));
		
		
		OrderListBean orderListBean = new OrderListBean();
		orderListBean.setOrder_idx(Integer.parseInt(request.getParameter("order_idx")));
		orderListBean.setOrder_amount(Integer.parseInt(request.getParameter("amount")));
		orderListBean.setOrder_member_email(request.getParameter("buyer_email"));
		orderListBean.setOrder_receiver_phone(request.getParameter("buyer_tel"));
		orderListBean.setOrder_receiver_address(request.getParameter("buyer_addr"));
		orderListBean.setOrder_receiver_post(request.getParameter("buyer_postcode"));
		
//		orderListService.insertOrderList(orderListBean);
		
		String products = request.getParameter("product_idx");
		String quantitys = request.getParameter("product_quantity");
		
		String[] product = products.split("/");
		String[] quantity = quantitys.split("/");
		
		Map<String, String> map = new HashMap<String, String>();
		
//		for(String pd : product) {
//			map.put(pd, "");
//		}
//		for(int i = 0; i < quantity.length(); i++) {
//			map.put([i], qt);
//		}
//		orderDetailService.insertOrderDetailList(map);
		
		
		
		
		
		
		
		return "/dailyShop/member/checkout_finish";
	}

	
	
}
