package com.itwillbs.service;

import java.util.ArrayList;

import com.itwillbs.domain.BasketBean;
import com.itwillbs.domain.ProductBean;

public interface ProductService {
	public ArrayList<ProductBean> getProductAllList();
	
	public ArrayList<ProductBean> getProductAllList30();

	public ArrayList<ProductBean> getProductSitrusList();

	public ArrayList<ProductBean> getProductAquaList();
	
	public ArrayList<ProductBean> getProductAllList50();

	public ArrayList<ProductBean> getProductSitrusList50();

	public ArrayList<ProductBean> getProductAquaList50();

	public ArrayList<ProductBean> getProductBestList();

	public ProductBean view(int product_idx);

	public void insertProduct(ProductBean productBean);

	public void setStatusRelease(int product_idx);

	public void setStatusDiscontinue(int product_idx);

	public void updateProduct(ProductBean productBean);
	
	public boolean intoBasket(BasketBean basketBean);

	public ArrayList<ProductBean> getProductSearchList(String search);

}
