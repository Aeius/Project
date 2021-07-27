package com.itwillbs.controller;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.MemberBean;
import com.itwillbs.domain.ProductBean;
import com.itwillbs.domain.WishListBean;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.ProductService;
import com.itwillbs.service.WishListService;

@Controller
public class ProductController {
	
	@Inject
	private ProductService productService;
	
	@Inject WishListService wishListService;

//	가상주소  http://localhost:8080/myweb2/member/insert
	
	//-------------------------------------------------------------- 상품 리스트 --------------------------------------------------------
	@RequestMapping(value = "/productList.sh", method = RequestMethod.GET)
	public String list(HttpSession session, Model model) {
		
		// member 정보 전체를 조회
		ArrayList<ProductBean> allList = productService.getProductAllList();
		ArrayList<ProductBean> sitrusList = productService.getProductSitrusList();
		ArrayList<ProductBean> aquaList = productService.getProductAquaList();
		//Model mb.mb 데이터 담아 가기
		model.addAttribute("allList" , allList);
		model.addAttribute("sitrusList" , sitrusList);
		model.addAttribute("aquaList" , aquaList);
		
		//  /WEB-INF/views/member/info.jsp 이동
		
		return "/dailyShop/product_board/product";
	}
	
	//-------------------------------------------------------------- 상품 상세 페이지 --------------------------------------------------------
	@RequestMapping(value = "/productDetail.sh", method = RequestMethod.GET)
	public String view(@RequestParam("product_idx") int product_idx, Model model, HttpSession session) {
		ProductBean pd = productService.view(product_idx);
		WishListBean wishListBean = new WishListBean();
		wishListBean.setProduct_idx(product_idx);
		wishListBean.setWishList_member_email((String)session.getAttribute("member_email"));
		WishListBean wl = wishListService.checkWishList(wishListBean);
		
		model.addAttribute("pd", pd);
		model.addAttribute("wl", wl);
		
		
		return "/dailyShop/product_board/product-detail";
		
	}
	
	
	
}
