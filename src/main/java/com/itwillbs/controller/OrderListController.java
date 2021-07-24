package com.itwillbs.controller;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.OrderListBean;
import com.itwillbs.domain.WishListBean;
import com.itwillbs.service.OrderListService;
import com.itwillbs.service.OrderService;



@Controller
public class OrderListController {
	
	@Inject
	private OrderListService orderListService;
	
	
	//-------------------------------------------------------------- 주문내역 리스트 --------------------------------------------------------
	@RequestMapping(value = "/orderList.sh", method = RequestMethod.GET)
	public String orderList(HttpSession session, Model model) {
		String order_member_email = (String)session.getAttribute("member_email");
		
		// member 정보 전체를 조회
		ArrayList<OrderListBean> orderList = orderListService.getOrderList(order_member_email);
		
		//Model 데이터 담아 가기
		model.addAttribute("orderList" , orderList);
		
		
		return "/dailyShop/member/orderList";
	}
	
}
