package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.dao.ProductDAO;
import com.itwillbs.domain.BasketBean;
import com.itwillbs.domain.MemberBean;
import com.itwillbs.domain.ProductBean;

@Service
public class ProductServiceImpl implements ProductService {
	
	// xml에서 객체생성한것을 set 메서드를 통해서 부모인터페이스 멤버변수에 객체 생성한 것을 자동으로 전달 받기(Inject 사용)
	@Inject
	private ProductDAO productDAO;

	@Override
	public ArrayList<ProductBean> getProductAllList() {
		return (ArrayList)productDAO.getProductAllList();
	}
	
	@Override
	public ArrayList<ProductBean> getProductAllList30() {
		return (ArrayList)productDAO.getProductAllList();
	}

	@Override
	public ArrayList<ProductBean> getProductSitrusList() {
		return (ArrayList)productDAO.getProductSitrusList();
	}

	@Override
	public ArrayList<ProductBean> getProductAquaList() {
		return (ArrayList)productDAO.getProductAquaList();
	}
	
	@Override
	public ArrayList<ProductBean> getProductAllList50() {
		return (ArrayList)productDAO.getProductAllList();
	}

	@Override
	public ArrayList<ProductBean> getProductSitrusList50() {
		return (ArrayList)productDAO.getProductSitrusList();
	}

	@Override
	public ArrayList<ProductBean> getProductAquaList50() {
		return (ArrayList)productDAO.getProductAquaList();
	}

	@Override
	public ArrayList<ProductBean> getProductBestList() {
		return (ArrayList)productDAO.getProductBestList();
	}
	
	@Override
	public ArrayList<ProductBean> getProductSearchList(String search) {
		return (ArrayList)productDAO.getProductSearchList(search);
	}
	
	@Override
	public ProductBean view(int product_idx) {
		return productDAO.view(product_idx);
	}

	@Override
	public void insertProduct(ProductBean productBean) {
		productDAO.insertProduct(productBean);
	}
	
	@Override
	public boolean intoBasket(BasketBean basketBean) {
		boolean isIntoBasket = false;
		int resultCount = 0;
		BasketBean basketBean2 = productDAO.checkBasket(basketBean);
		if(basketBean2 != null) {
			resultCount = productDAO.updateBasket(basketBean);
		} else {
			resultCount = productDAO.intoBasket(basketBean);
		}
		if(resultCount > 0) {
			isIntoBasket = true;
		}
		return isIntoBasket;
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


	
	
	

	

}
