package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

public class WishListDAOImpl implements WishListDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mapper.WishListMapper";

	@Override
	public void insertWishList(String member_email, int product_idx) {
		sqlSession.insert(namespace+"");
	}

	@Override
	public void deleteWishList(String member_email, int product_idx) {
		sqlSession.delete(namespace+"");
	}

	@Override
	public boolean checkWishList(String member_email, int product_idx) {
		return sqlSession.selectOne(namespace+"", member_email);
	}
}


