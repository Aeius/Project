package com.itwillbs.dao;

import java.util.ArrayList;

import com.itwillbs.domain.ProductBean;
import com.itwillbs.domain.WishListBean;

public interface WishListDAO {
	public void insertWishList(String member_email, int product_idx);
	
	public void deleteWishList(String member_email, int product_idx);
	
	public boolean checkWishList(String member_email, int product_idx);
	
	public ArrayList<WishListBean> getMyWishList();
}
