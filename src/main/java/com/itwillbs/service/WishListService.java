package com.itwillbs.service;

public interface WishListService {

	public void deleteWishList(int product_idx, String member_email);

	public boolean checkWishList(int product_idx, String member_email);

	public void insertWishList(int product_idx, String member_email);

}
