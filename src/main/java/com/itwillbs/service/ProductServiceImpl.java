package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ProductDAO;
import com.itwillbs.domain.CategoryBean;
import com.itwillbs.domain.ChartBean;
import com.itwillbs.domain.ProductBean;
import com.itwillbs.domain.RecoBean;

@Service
public class ProductServiceImpl implements ProductService {
	//powdery / floral / woody / aqua / fruity / sitrus / spices / modern
	
	// xml에서 객체생성한것을 set 메서드를 통해서 부모인터페이스 멤버변수에 객체 생성한 것을 자동으로 전달 받기(Inject 사용)
	@Inject
	private ProductDAO productDAO;

	@Override
	public ArrayList<ProductBean> getProductAllList() {
		return (ArrayList)productDAO.getProductAllList();
	}
	// --------------- 30ml ----------------------------------------
	@Override
	public ArrayList<ProductBean> getProductAllList30() {
		return (ArrayList)productDAO.getProductAllList30();
	}

	@Override
	public ArrayList<ProductBean> getProductPowderyList() {
		return (ArrayList)productDAO.getProductPowderyList();
	}

	@Override
	public ArrayList<ProductBean> getProductFloralList() {
		return (ArrayList)productDAO.getProductFloralList();
	}
	@Override
	public ArrayList<ProductBean> getProductWoodyList() {
		return (ArrayList)productDAO.getProductWoodyList();
	}
	
	@Override
	public ArrayList<ProductBean> getProductAquaList() {
		return (ArrayList)productDAO.getProductAquaList();
	}
	@Override
	public ArrayList<ProductBean> getProductFruityList() {
		return (ArrayList)productDAO.getProductFruityList();
	}
	
	@Override
	public ArrayList<ProductBean> getProductSpicesList() {
		return (ArrayList)productDAO.getProductSpicesList();
	}
	@Override
	public ArrayList<ProductBean> getProductSitrusList() {
		return (ArrayList)productDAO.getProductSitrusList();
	}
	
	@Override
	public ArrayList<ProductBean> getProductModernList() {
		return (ArrayList)productDAO.getProductModernList();
	}
	
	// --------------- 50ml ----------------------------------------
	
	@Override
	public ArrayList<ProductBean> getProductAllList50() {
		return (ArrayList)productDAO.getProductAllList50();
	}

	@Override
	public ArrayList<ProductBean> getProductPowderyList50() {
		return (ArrayList)productDAO.getProductPowderyList50();
	}

	@Override
	public ArrayList<ProductBean> getProductFloralList50() {
		return (ArrayList)productDAO.getProductFloralList50();
	}
	@Override
	public ArrayList<ProductBean> getProductWoodyList50() {
		return (ArrayList)productDAO.getProductWoodyList50();
	}
	
	@Override
	public ArrayList<ProductBean> getProductAquaList50() {
		return (ArrayList)productDAO.getProductAquaList50();
	}
	@Override
	public ArrayList<ProductBean> getProductFruityList50() {
		return (ArrayList)productDAO.getProductFruityList50();
	}
	
	@Override
	public ArrayList<ProductBean> getProductSpicesList50() {
		return (ArrayList)productDAO.getProductSpicesList50();
	}
	@Override
	public ArrayList<ProductBean> getProductSitrusList50() {
		return (ArrayList)productDAO.getProductSitrusList50();
	}
	
	@Override
	public ArrayList<ProductBean> getProductModernList50() {
		return (ArrayList)productDAO.getProductModernList50();
	}
	
	//--------------------------------------------------------------
	@Override
	public ArrayList<ProductBean> getProductBestList() {
		return (ArrayList)productDAO.getProductBestList();
	}
	
	@Override
	public ArrayList<ProductBean> getProductSearchList(String search) {
		return (ArrayList)productDAO.getProductSearchList(search);
	}
	
	@Override
	public ProductBean getProductInfo(int product_idx) {
		return productDAO.getProductInfo(product_idx);
	}

	@Override
	public void insertProduct(ProductBean productBean) {
		productDAO.insertProduct(productBean);
	}
	
	@Override
	public void setStatusRelease(int product_idx) {
		productDAO.setStatusRelease(product_idx);
	}

	@Override
	public void setStatusDiscontinue(int product_idx) {
		productDAO.setStatusDiscontinue(product_idx);
	}

	@Override
	public void updateProduct(ProductBean productBean) {
		productDAO.updateProduct(productBean);
	}

	@Override
	public ArrayList<ProductBean> getBarList() {
		return productDAO.getBarList();
	}
	@Override
	public ArrayList<ChartBean> getLineList() {
		return productDAO.getLineList();
	}
	@Override
	public ArrayList<CategoryBean> getDonutList() {
		return productDAO.getDonutList();
	}
	@Override
	public ArrayList<RecoBean> getRecoList() {
		return productDAO.getRecoList();
	}
	
	

	

}
