package com.itwillbs.service;

import javax.inject.Inject;

import com.itwillbs.dao.ProductDAO;
import com.itwillbs.dao.WishListDAO;

public class WishListServiceImpl implements WishListService {
	
	// xml에서 객체생성한것을 set 메서드를 통해서 부모인터페이스 멤버변수에 객체 생성한 것을 자동으로 전달 받기(Inject 사용)
		@Inject
		private WishListDAO wishListDAO;

		@Override
		public void insertWishList(int product_idx, String member_email) {
			wishListDAO.insertWishList(member_email, product_idx);
		}
		
		@Override
		public void deleteWishList(int product_idx, String member_email) {
			wishListDAO.deleteWishList(member_email, product_idx);
		}
	
		@Override
		public boolean checkWishList(int product_idx, String member_email) {
			return wishListDAO.checkWishList(member_email, product_idx);
		}

}
