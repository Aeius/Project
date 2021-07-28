package com.itwillbs.controller;

import java.util.ArrayList;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.ProductBean;
import com.itwillbs.domain.WishListBean;
import com.itwillbs.service.WishListService;

@Controller
public class WishListController {

	@Inject
	private WishListService wishListService;

	// ------------------------------------------------------------- 내 좋아요 리스트 출력 --------------------------------------------------------
	@RequestMapping(value = "/myWishList.sh", method = RequestMethod.GET)
	public String myWishList(HttpSession session, Model model) {
		String wishList_member_email = (String) session.getAttribute("member_email");

		ArrayList<WishListBean> myWishList = wishListService.getMyWishList(wishList_member_email);

		model.addAttribute("myWishList", myWishList);

		return "/dailyShop/member/wishlist";

	}

	// -------------------------------------------------------------- 찜 리스트에서 삭제 --------------------------------------------------------
	@RequestMapping(value = "/deleteWishList.sh", method = RequestMethod.GET)
	public String deleteWishList(HttpServletRequest request, HttpSession session,@RequestParam("product_idx") int product_idx) {
		System.out.println("WishListController - pushWishList()");

		WishListBean wishListBean = new WishListBean();
		wishListBean.setProduct_idx(product_idx); // 현재 접근한 상세페이지의 상품번호 (product_idx) 파라미터 가져오기
		wishListBean.setWishList_member_email((String) session.getAttribute("member_email")); // 세션에있는(로그인되어있는) 회원이메일정보

		wishListService.deleteWishList(wishListBean);

//				
		return "redirect:/myWishList.sh";
		
	}
			
}
