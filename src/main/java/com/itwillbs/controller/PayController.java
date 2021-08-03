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
import java.util.HashMap;
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
import com.itwillbs.domain.ProductBean;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.ProductService;

@Controller
public class PayController {

	@Inject
	private ProductService productService;
	
	@Inject
	private MemberService memberService;
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
		
		System.out.println("결제 금액 : " + request.getParameter("amount"));
//		order_price : rsp.paid_amount,
//		order_member_email : rsp.buyer_email,
//	    order_receiver_name : rsp.buyer_name,
//	    order_receiver_phone : rsp.buyer_tel,
//	    order_receiver_address : rsp.buyer_addr,
//	    order_receiver_post : rsp.buyer_postcode
//		OrderBean orderBean = new OrderBean();
//		orderBean.setOrder_amount(Integer.parseInt(request.getParameter("order_price")));
//		orderBean.setOrder_member_email(request.getParameter("order_member_email"));
//		
//		System.out.println(request.getParameter("order_member_email"));
//		System.out.println(request.getParameter("order_price"));
//		System.out.println(request.getParameter("order_receiver_name"));
		
		return "/dailyShop/member/checkout_finish";
	}

	
	
}
