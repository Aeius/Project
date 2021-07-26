package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.WishListBean;
import com.itwillbs.service.WishListService;


@RestController
public class AjaxController {
	
	@Inject
	private WishListService wishListService;
	
	//-------------------------------------------------------------- 찜(좋아요) 버튼 눌렀을 때 --------------------------------------------------------
		@RequestMapping(value = "/pushWishList.sh", method = RequestMethod.GET)
		public ResponseEntity<String> pushWishList(HttpServletRequest request, HttpSession session, @RequestParam("product_idx") int product_idx) {
			System.out.println("WishListController - pushWishList()");
			String result = "";
			
			WishListBean wishListBean = new WishListBean();
			wishListBean.setProduct_idx(product_idx);  // 현재 접근한 상세페이지의 상품번호 (product_idx) 파라미터 가져오기
			wishListBean.setWishList_member_email((String)session.getAttribute("member_email")); // 세션에있는(로그인되어있는) 회원이메일정보 불러오기 
			
			// SQL구문 만능문자에 가져갈 데이터를 Bean에 담아서 전달하는 과정 
			
			ResponseEntity<String> entity;
			try {
				WishListBean checkWishList =  wishListService.checkWishList(wishListBean);
//			System.out.println("WishListController - chekcWishList() 리턴 값 : " + checkWishList);
				int wishListCount = Integer.parseInt(checkWishList.getWishlistcount());  
				//SQL구문 결과 값 
				//(SELECT COUNT(*) as wishListCount FROM wishlist WHERE wishlist_member_email=member_email AND wishlist_product_idx=product_idx) 
				// |---------------|
				// | wishListCount |
				// |---------------|
				// |             1 |
				// |---------------|
				//가져와 저장하려면 리턴할 Bean에 멤버변수로 컬럼앨리어스로 지정한 wishListCount와 동일한 이름의 변수가 있어야 
				//SQL 구문 결과값을 자동으로 해당 Bean에 저장함
				//최종적으로 SQL 구문결과값을 저장한 Bean이 리턴이 됨 그래서 해당 Bean에서 데이터 꺼내서 정수형으로 변환 후
				//판별하여 좋아요 숫자 증가 혹은 삭제 구문 실행.
				
				if(wishListCount > 0) {
//				System.out.println("checkWishList > 0 true 일때");
					wishListService.deleteWishList(wishListBean);
					result = "하트해제";
				} else {
//				System.out.println("checkWishList > 0 false 일때");
					wishListService.insertWishList(wishListBean);
					result = "하트생성";
				}
				
				entity = new ResponseEntity<String>(result, HttpStatus.OK);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			}
			
//			return "redirect:/productDetail.sh?product_idx="+product_idx; // ajax 미구현으로 인한 새로고침
			return entity;
		}
}
