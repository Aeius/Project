package com.itwillbs.dao;

import java.util.ArrayList;

import com.itwillbs.domain.MemberBean;
import com.itwillbs.domain.ProductBean;

public interface ProductDAO {
	public ArrayList<ProductBean> getProductAllList();

	public ArrayList<ProductBean> getProductSitrusList();

	public ArrayList<ProductBean> getProductAquaList();
	
	public ProductBean view(int product_idx);


}