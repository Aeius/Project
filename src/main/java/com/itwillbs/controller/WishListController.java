package com.itwillbs.controller;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.ProductBean;
import com.itwillbs.domain.WishListBean;
import com.itwillbs.service.WishListService;

@Controller
public class WishListController {
	
	@Inject
	private WishListService wishListService;

//	가상주소  http://localhost:8080/myweb2/member/insert
	
	//-------------------------------------------------------------- 찜(좋아요) 버튼 눌렀을 때 --------------------------------------------------------
	@RequestMapping(value = "/pushWishList.sh", method = RequestMethod.GET)
	public void pushWishList(@RequestParam("product_idx") int product_idx, HttpSession session) {
		
		String member_email = (String)session.getAttribute("member_email");
		
		boolean isCheckWish = wishListService.checkWishList(product_idx, member_email);
		
		if(isCheckWish) {
			wishListService.deleteWishList(product_idx, member_email);
		} else {
			wishListService.insertWishList(product_idx, member_email);
		}
		
	}
	
	@RequestMapping(value = "/myWishList.sh", method = RequestMethod.GET)
	public String myWishList(HttpSession session, Model model) {
		
		ArrayList<WishListBean> myWishList = wishListService.getMyWishList();
		
		model.addAttribute("myWishList" , myWishList);
		
		return "/dailyShop/member/wishlist";
			
		
	}
	
}
