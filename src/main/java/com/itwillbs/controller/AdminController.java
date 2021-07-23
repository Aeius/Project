package com.itwillbs.controller;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.OrderBean;
import com.itwillbs.domain.OrderDetailBean;
import com.itwillbs.domain.ProductBean;
import com.itwillbs.service.AdminService;
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
	public String productList() {
		// (임시 확인용)
		return "/AdminLTE-master/pages/productList";
	}
	
	// ------------------ 주문목록 ---------------------
	@RequestMapping(value = "/orderList.ad", method = RequestMethod.GET)
	public String orderList(Model model) {
		ArrayList<OrderBean> allList = orderService.getOrderAllList();
		model.addAttribute("allList", allList);
		return "/AdminLTE-master/pages/orderList";
		// insert into orderlist values(null,'one@naver.com','홍길동','010-1234-1234',14243,'주소','무슨동','몇호',50000,0,0,'배송중','2021-07-22','무통장',5837573);
		// 'one@naver.com' 부분에는 본인 DB에 있는 회원아이디 넣어야 합니다!
	}
	
	// ------------------ 주문상세 ---------------------
	@RequestMapping(value = "/orderDetail.ad", method = RequestMethod.GET)
	public String orderDetail(Model model, HttpServletRequest request) {
		
		int order_idx = Integer.parseInt(request.getParameter("order_idx"));
		
		OrderBean orderBean = orderService.getOrderDetail(order_idx);
		ArrayList<OrderDetailBean> orderProductList = orderDetailService.getOrderProductList(order_idx);
		
		ArrayList<ProductBean> orderProductInfo = new ArrayList<ProductBean>(); // 상품 정보를 저장할 리스트
		for(OrderDetailBean bean : orderProductList) { 
			ProductBean productBean = productService.view(bean.getOrder_detail_product_idx()); // 상품 정보 받아오기
			orderProductInfo.add(productBean); // 리스트에 추가
		}
		
		model.addAttribute("orderBean", orderBean);
		model.addAttribute("orderProductList", orderProductList);
		model.addAttribute("orderProductInfo", orderProductInfo);
		
		return "/AdminLTE-master/pages/orderDetail";
	}
	
}