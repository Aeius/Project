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

import com.itwillbs.domain.BasketBean;
import com.itwillbs.domain.ProductBean;
import com.itwillbs.domain.WishListBean;
import com.itwillbs.service.BasketService;
import com.itwillbs.service.WishListService;


@RestController
public class AjaxController {
	
	@Inject
	private WishListService wishListService;
	
	@Inject
	private BasketService basketService;
	
	//-------------------------------------------------------------- 찜(좋아요) 버튼 눌렀을 때 --------------------------------------------------------
	@RequestMapping(value = "/pushWishList.sh", method = RequestMethod.GET)
	public ResponseEntity<String> pushWishList(HttpServletRequest request, HttpSession session, @RequestParam("product_idx") int product_idx) {
		System.out.println("WishListController - pushWishList()");
		String result = "";
		ResponseEntity<String> entity = null;
		int request_product_idx = Integer.parseInt(request.getParameter("product_idx")); 
		String request_member_email = request.getParameter("member_email");
		
		try {
//			request.getParameter("")
			// SQL구문 만능문자에 가져갈 데이터를 Bean에 담아서 전달하는 과정 
			WishListBean wishListBean = new WishListBean();
			wishListBean.setProduct_idx(request_product_idx);  // 현재 접근한 상세페이지의 상품번호 (product_idx) 파라미터 가져오기
			wishListBean.setWishList_member_email(request_member_email); // 세션에있는(로그인되어있는) 회원이메일정보 불러오기 
			
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
				result = "offHeart";
			} else {
//				System.out.println("checkWishList > 0 false 일때");
				wishListService.insertWishList(wishListBean);
				result = "onHeart";
			}
			
			entity = new ResponseEntity<String>(result, HttpStatus.OK);
		} catch (NumberFormatException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			
		}
		return entity;
	}
		
		//-------------------------------------------------------------- wishListCount 체크-------------------------------------------------------------------------
		@RequestMapping(value = "/checkWishCount.sh", method = RequestMethod.GET)
		public ResponseEntity<String> checkWishCount(HttpServletRequest request, HttpSession session) {
			System.out.println("WishListController - checkWishCount()");
			ResponseEntity<String> entity = null;
			System.out.println(request.getParameter("product_idx"));
			int product_idx = Integer.parseInt(request.getParameter("product_idx")); 
			try {
				
				ProductBean checkWishCount =  wishListService.checkWishCount(product_idx);
				System.out.println("checkWishCount실행됨");
//			System.out.println("WishListController - chekcWishList() 리턴 값 : " + checkWishList);
				String wishCount = checkWishCount.getProduct_likecount()+"";  
//				SQL 구문 : SELECT product_likecount from product where product_idx = #{product_idx}
				
				System.out.println(wishCount);
				entity = new ResponseEntity<String>(wishCount, HttpStatus.OK);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			}
			
//			return "redirect:/productDetail.sh?product_idx="+product_idx; // ajax 미구현으로 인한 새로고침
		return entity;
	}
	

	//------------------------------------------------------------------------ 장바구니 담기 ------------------------------------------------------
	@RequestMapping(value = "/intoBasket.sh", method = RequestMethod.GET)
	public ResponseEntity<String> intoBasket(HttpServletRequest request) {
		String result = ""; // 문자열로 결과 값 저장
		ResponseEntity<String> entity = null; // 저장한 문자열을 담아서 전달하기 위한 객체
		
		try {
			// BasketBean 객체에 저장할 값 불러오기
			String member_email = request.getParameter("member_email");
			int product_idx = Integer.parseInt(request.getParameter("product_idx"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			System.out.println(member_email + product_idx + quantity);
			
			// BasketBean 객체 생성해서 바로 저장
			BasketBean basketBean = new BasketBean(member_email, product_idx, quantity);
			
			// basketService에서 처리 후 결과 리턴
			boolean isIntoBasket = basketService.intoBasket(basketBean);
			
			// 리턴 결과에 따라 in/out 리턴
			if(isIntoBasket) {
				result = "in";
			} else {
				result = "out";
			}
			entity = new ResponseEntity<String>(result, HttpStatus.OK);
		}catch (Exception e) {
			System.out.println("오류 발생 -" + e.getMessage());
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	//-------------------------------------------------------------- 로그인 확인 --------------------------------------------------------
	@RequestMapping(value = "/checkSession.sh", method = RequestMethod.GET)
	public ResponseEntity<String> checkSession(HttpServletRequest request) {
		String result = ""; // 문자열로 결과 값 저장
		ResponseEntity<String> entity = null;

		try {
			String member_email = request.getParameter("member_email");
			// member_email == null 은 안되고 문자열 비교하니까 작동
			if(member_email == "") {
				result = "empty";
			} else {
				result = "notEmpty";
			}

			entity = new ResponseEntity<String>(result, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println("오류 발생 -" + e.getMessage());
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//-------------------------------------------------------------- 장바구니 삭제 --------------------------------------------------------
	@RequestMapping(value = "/deleteBasket.sh", method = RequestMethod.GET)
	public ResponseEntity<String> deleteBasket(HttpServletRequest request) {
		String result = ""; // 문자열로 결과 값 저장
		ResponseEntity<String> entity = null;

		try {
			String member_email = request.getParameter("member_email");
			String product_idx = request.getParameter("product_idx");
			
			int deleteCount = basketService.deleteBasket(member_email, product_idx);
			
			if(deleteCount != 0) {
				result = "deletedSuccess";
			} else {
				result = "deleteFail";
			}

			entity = new ResponseEntity<String>(result, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println("오류 발생 -" + e.getMessage());
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
//------------------------------------------------------------------------ 장바구니 수량 변경 ------------------------------------------------------
	@RequestMapping(value = "/updateBasketQuantity.sh", method = RequestMethod.GET)
	public ResponseEntity<String> updateBasketQuantity(HttpServletRequest request) {
		String result = ""; // 문자열로 결과 값 저장
		ResponseEntity<String> entity = null; // 저장한 문자열을 담아서 전달하기 위한 객체
		
		try {
			// BasketBean 객체에 저장할 값 불러오기
			String member_email = request.getParameter("member_email");
			int product_idx = Integer.parseInt(request.getParameter("product_idx"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			System.out.println(member_email + product_idx + quantity);
			
			// BasketBean 객체 생성해서 바로 저장
			BasketBean basketBean = new BasketBean(member_email, product_idx, quantity);
			
			// basketService에서 처리 후 결과 리턴
			boolean isIntoBasket = basketService.updateBasketQuantity(basketBean);
			
			// 리턴 결과에 따라 in/out 리턴
			if(isIntoBasket) {
				result = "in";
			} else {
				result = "out";
			}
			entity = new ResponseEntity<String>(result, HttpStatus.OK);
		}catch (Exception e) {
			System.out.println("오류 발생 -" + e.getMessage());
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
		


}
