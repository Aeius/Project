package com.itwillbs.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.BasketBean;
import com.itwillbs.domain.CouponBean;
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
		
		List<CouponBean> couponList = basketService.getMemberCouponList(member_email);
		if(couponList != null) {
			model.addAttribute("couponList", couponList);
		}
		return "/dailyShop/member/basket";
	}

	//-------------------------------------------------------------- 장바구니 담기 후 팝업창 주소 이동 --------------------------------------------------------
	@RequestMapping(value = "/basketPopUp.sh", method = RequestMethod.GET)
	public String basketPopUp() {
		return "/dailyShop/product_board/basketPopUp";
	}
	
	//-------------------------------------------------------------- 장바구니 담기 후 팝업창 주소 이동 --------------------------------------------------------
	@RequestMapping(value = "/checkout.sh", method = RequestMethod.POST)
	public String checkout(HttpServletRequest request) {
		// basketBean 저장할 List 객체
		List<BasketBean> basketList = new ArrayList<BasketBean>();
		// 제품 정보 저장할 DTO 객체
		BasketBean basketBean = null;
		
		int coupon_idx = Integer.parseInt(request.getParameter("coupon_idx"));
		System.out.println("Selected Coupon_idx : " + coupon_idx);
		
		// 배열로 받아오기
		String[] arrProduct_idx = request.getParameterValues("product_idx");
		// 반복문
		for(int i = 0; i < arrProduct_idx.length; i++) {
			// 값 확인용 코드
			System.out.println("product_idx[" + i + "] : " + arrProduct_idx[i]);

			// 여기서 리스트에 추가하는 작업 하시면 됩니다:)
			
		}
		return "/dailyShop/member/checkout";
	}
	//----------------------------------------------------- 찜리스트에서 장바구니 추가 ---------------------------------------------
	@RequestMapping(value = "/insertBasket.sh", method = RequestMethod.GET)
	public String insertBasket(HttpServletRequest request) {
		
			// BasketBean 객체에 저장할 값 불러오기
			String member_email = request.getParameter("member_email");
			int product_idx = Integer.parseInt(request.getParameter("product_idx"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			System.out.println(member_email + product_idx + quantity);
			
			// BasketBean 객체 생성해서 바로 저장
			BasketBean basketBean = new BasketBean(member_email, product_idx, quantity);
			
			// basketService에서 처리 후 결과 리턴
			boolean isIntoBasket = basketService.intoBasket(basketBean);
			
			
		return "redirect:myWishList.sh";
	}
	

}