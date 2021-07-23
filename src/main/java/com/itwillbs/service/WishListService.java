package com.itwillbs.service;

import java.util.ArrayList;

import com.itwillbs.domain.ProductBean;
import com.itwillbs.domain.WishListBean;

public interface WishListService {

	public void deleteWishList(int product_idx, String member_email);

	public boolean checkWishList(int product_idx, String member_email);

	public void insertWishList(int product_idx, String member_email);

	public ArrayList<WishListBean> getMyWishList(String wishList_member_email);

}
