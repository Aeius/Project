package com.itwillbs.controller;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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

	
	//------------------------------------------------------------- 내 좋아요 리스트 출력 --------------------------------------------------------
	@RequestMapping(value = "/myWishList.sh", method = RequestMethod.GET)
	public String myWishList(HttpSession session, Model model) {
		String wishList_member_email = (String)session.getAttribute("member_email");
		
		ArrayList<WishListBean> myWishList = wishListService.getMyWishList(wishList_member_email);
		
		model.addAttribute("myWishList" , myWishList);
		
		return "/dailyShop/member/wishlist";
			
		
	}
	
}
