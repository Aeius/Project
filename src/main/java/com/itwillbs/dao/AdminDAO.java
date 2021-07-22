package com.itwillbs.dao;

import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProductBean;

public interface AdminDAO {
	
	public void insertProduct(ProductBean productBean);
	
}
