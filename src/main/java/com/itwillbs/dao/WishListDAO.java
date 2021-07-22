package com.itwillbs.dao;

public interface WishListDAO {
	public void insertWishList(String member_email, int product_idx);
	
	public void deleteWishList(String member_email, int product_idx);
	
	public boolean checkWishList(String member_email, int product_idx);
}
