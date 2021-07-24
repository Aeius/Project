package com.itwillbs.dao;

import java.util.ArrayList;

import com.itwillbs.domain.ProductBean;
import com.itwillbs.domain.WishListBean;

public interface WishListDAO {
	public void insertWishList(WishListBean wishListBean);
	
	public void deleteWishList(WishListBean wishListBean);
	
	public void updateWishList(int product_idx);
	
	public ArrayList<WishListBean> getMyWishList(String wishlist_member_email);

	public WishListBean checkWishList(WishListBean wishListBean);
	
}
