package com.itwillbs.dao;

import java.util.ArrayList;

import com.itwillbs.domain.BasketBean;
import com.itwillbs.domain.MemberBean;
import com.itwillbs.domain.ProductBean;

public interface ProductDAO {
	// powdery / floral / woody / aqua / fruity / sitrus / spices / modern
	public ArrayList<ProductBean> getProductAllList();
	
	public ArrayList<ProductBean> getProductAllList30();

	public ArrayList<ProductBean> getProductPowderyList();
	public ArrayList<ProductBean> getProductFloralList();
	public ArrayList<ProductBean> getProductWoodyList();
	public ArrayList<ProductBean> getProductAquaList();
	public ArrayList<ProductBean> getProductFruityList();
	public ArrayList<ProductBean> getProductSitrusList();
	public ArrayList<ProductBean> getProductSpicesList();
	public ArrayList<ProductBean> getProductModernList();
	
	public ArrayList<ProductBean> getProductAllList50();

	public ArrayList<ProductBean> getProductPowderyList50();
	public ArrayList<ProductBean> getProductFloralList50();
	public ArrayList<ProductBean> getProductWoodyList50();
	public ArrayList<ProductBean> getProductAquaList50();
	public ArrayList<ProductBean> getProductFruityList50();
	public ArrayList<ProductBean> getProductSitrusList50();
	public ArrayList<ProductBean> getProductSpicesList50();
	public ArrayList<ProductBean> getProductModernList50();
	
	public ArrayList<ProductBean> getProductBestList();

	public ProductBean getProductInfo(int product_idx);

	public void insertProduct(ProductBean productBean);
	
	public void setStatusRelease(int product_idx);
	
	public void setStatusDiscontinue(int product_idx);
	
	public void updateProduct(ProductBean productBean);
	
	public BasketBean checkBasket(BasketBean basketBean);

	public int intoBasket(BasketBean basketBean);

	public int updateBasket(BasketBean basketBean);

	public ArrayList getProductSearchList(String search);


}
