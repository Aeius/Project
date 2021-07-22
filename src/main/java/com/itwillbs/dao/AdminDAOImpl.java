package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProductBean;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mapper.AdminMapper";
	
	@Override
	public void insertProduct(ProductBean productBean) {
		sqlSession.insert(namespace + ".insertProduct", productBean);
	}

}
