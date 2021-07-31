package com.itwillbs.service;

import java.util.ArrayList;

import com.itwillbs.domain.ProductBean;
import com.itwillbs.domain.WishListBean;

public interface WishListService {
	
	public void insertWishList(WishListBean wishListBean);

	public void deleteWishList(WishListBean wishListBean);

	public void updateWishList(int product_idx);

	public ArrayList<WishListBean> getMyWishList(String wishList_member_email);

	public WishListBean checkWishList(WishListBean wishListBean);

	public ProductBean checkWishCount(int product_idx);

	public ArrayList<WishListBean> checkHeart(String member_email);
	

}
