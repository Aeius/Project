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
	public void insertWishList(WishListBean wishListBean) {
		System.out.println("DAOImpl - insertWishList");
		sqlSession.insert(namespace+".insertWishList", wishListBean);
	}

	@Override
	public void deleteWishList(WishListBean wishListBean) {
		System.out.println("DAOImpl - deleteWishList");
		sqlSession.delete(namespace+".deleteWishList", wishListBean);
	}

	@Override
	public void updateWishList(int product_idx) {
		System.out.println("DAOImpl - updateWishList");
		sqlSession.selectOne(namespace+".updateWishList", product_idx);
	}

	@Override
	public ArrayList<WishListBean> getMyWishList(String wishList_member_email) {
		return (ArrayList)sqlSession.selectList(namespace+".myWishList", wishList_member_email);
	}

	@Override
	public WishListBean checkWishList(WishListBean wishListBean) {
//		System.out.println("DAOImpl - checkWishList");
//		WishListBean o = sqlSession.selectOne(namespace+".checkWishList", wishListBean);
//		System.out.println(o);
		return sqlSession.selectOne(namespace+".checkWishList", wishListBean);
		
	}

	@Override
	public ProductBean checkWishCount(int product_idx) {
		return sqlSession.selectOne(namespace+".checkWishCount",product_idx);
	}
}


