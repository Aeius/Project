package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.BasketBean;

@Repository
public class BasketDAOImpl implements BasketDAO	{

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.itwillbs.mapper.BasketMapper";

	@Override
	public List<BasketBean> getBasketList(String member_email) {
		return sqlSession.selectList(namespace + ".getBasketList", member_email);
	}

}