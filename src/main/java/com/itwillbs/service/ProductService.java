package com.itwillbs.service;

import java.util.ArrayList;

import com.itwillbs.domain.MemberBean;
import com.itwillbs.domain.ProductBean;

public interface ProductService {
	public ArrayList<ProductBean> getProductAllList();

	public ArrayList<ProductBean> getProductSitrusList();

	public ArrayList<ProductBean> getProductAquaList();

	public ArrayList<ProductBean> getProductBestList();

	public ProductBean view(int product_idx);

}
