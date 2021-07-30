package com.itwillbs.dao;

import java.util.HashMap;
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

	@Override
	public int deleteBasket(String member_email, String product_idx) {
		// 2개 이상의 파라미터를 전달 할 때는 Map 객체에 담아서 전달
		HashMap<String, Object> map = new HashMap<>();
		map.put("member_email", member_email);
		map.put("product_idx",product_idx);
		
		return sqlSession.delete(namespace + ".deleteBasket", map);
	}

}