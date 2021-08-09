package com.itwillbs.service;

import java.util.ArrayList;

import com.itwillbs.domain.CategoryBean;
import com.itwillbs.domain.ChartBean;
import com.itwillbs.domain.OrderDetailBean;
import com.itwillbs.domain.ProductBean;
import com.itwillbs.domain.RecoBean;

public interface ProductService {
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
	
	public ArrayList<ProductBean> getProductSearchList(String search);
	
	public ArrayList<ProductBean> getBarList();

	public ArrayList<ChartBean> getLineList();

	public ArrayList<CategoryBean> getDonutList();

	public ArrayList<RecoBean> getRecoList();

	public Integer getProductName(String product_name); // 상품등록시 이름 중복 확인용

	public void updateSellcount(String product_idx);

	public ArrayList<ProductBean> getProductAllListAdmin();

	public ProductBean getProductInfoAdmin(int product_idx); // 판매상태 상관없이 제품 정보 가져옴

	public void updateStock(OrderDetailBean orderDetailBean);

}
