package com.itwillbs.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.BasketBean;
import com.itwillbs.domain.MemberBean;

@Repository
public class BasketDAOImpl implements BasketDAO	{

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.itwillbs.mapper.BasketMapper";
	
	// 장바구니에 담겨 있는지 확인
	@Override
	public BasketBean checkBasket(BasketBean basketBean) {
		BasketBean basketBean2 = sqlSession.selectOne(namespace + ".checkBasket", basketBean);
		return basketBean2;
	}
	
	@Override
	public int intoBasket(BasketBean basketBean) {
		int insertCount = sqlSession.insert(namespace + ".intoBasket", basketBean);
		return insertCount;
	}

	// 장바구니에 담겨 있으면 수량만 변경
	@Override
	public int updateBasket(BasketBean basketBean) {
		return sqlSession.update(namespace + ".updateBasket", basketBean);
	}


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

	@Override
	public int updateBasketQuantity(BasketBean basketBean) {
		return sqlSession.update(namespace + ".updateBasketQuantity", basketBean);
	}

	@Override
	public void deleteBasketList(MemberBean memberBean) {
		sqlSession.delete(namespace + ".deleteBasketList" , memberBean);
		
	}
	
	

}