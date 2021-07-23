package com.itwillbs.dao;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProductBean;
import com.itwillbs.domain.WishListBean;

@Repository
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

	@Override
	public ArrayList<WishListBean> getMyWishList(String wishList_member_email) {
		return (ArrayList)sqlSession.selectList(namespace+".myWishList", wishList_member_email);
	}
}


