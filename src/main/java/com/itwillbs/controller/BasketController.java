package com.itwillbs.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.BasketBean;
import com.itwillbs.domain.ProductBean;
import com.itwillbs.service.BasketService;
import com.itwillbs.service.ProductService;

@Controller
public class BasketController {
	@Inject
	private BasketService basketService;

	//-------------------------------------------------------------- 장바구니 이동 --------------------------------------------------------
	@RequestMapping(value = "/basket.sh", method = RequestMethod.GET)
	public String basket(HttpSession session, Model model) {
		String member_email = (String) session.getAttribute("member_email");
//		System.out.println(member_email);

		// 고객의 장바구니 List 불러오기
		List<BasketBean> basketList = basketService.getBasketList(member_email);
		model.addAttribute("basketList", basketList);
		return "/dailyShop/member/basket";
	}

	//-------------------------------------------------------------- 장바구니 담기 후 팝업창 주소 이동 --------------------------------------------------------
	@RequestMapping(value = "/basketPopUp.sh", method = RequestMethod.GET)
	public String basketPopUp() {
		return "/dailyShop/product_board/basketPopUp";
	}


}