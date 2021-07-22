package com.itwillbs.dao;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberBean;
import com.itwillbs.domain.ProductBean;

@Repository
public class ProductDAOImpl implements ProductDAO {
	
	// 마이바티스 객체생성(생성자를 통해서 자동주입)
	@Inject
	private SqlSession sqlSession;
	
	// sql 구문 전체 이름 변수 정의
	private static final String namespace = "com.itwillbs.mapper.ProductMapper";
	
	@Override
	public ArrayList<ProductBean> getProductAllList() {
		return (ArrayList)sqlSession.selectList(namespace+".getProductAllList");
	}
	
	@Override
	public ArrayList<ProductBean> getProductSitrusList() {
		return (ArrayList)sqlSession.selectList(namespace+".getProductSitrusList");
	}
	
	@Override
	public ArrayList<ProductBean> getProductAquaList() {
		return (ArrayList)sqlSession.selectList(namespace+".getProductAquaList");
	}

	@Override
	public ProductBean view(int product_idx) {
		return sqlSession.selectOne(namespace+".getProductDetail", product_idx);
	}
	
	
}
