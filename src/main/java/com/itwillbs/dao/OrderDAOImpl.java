package com.itwillbs.dao;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.OrderBean;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mapper.OrderMapper";
	
	@Override
	public ArrayList<OrderBean> getOrderAllList() {
		return (ArrayList)sqlSession.selectList(namespace + ".getOrderAllList");
	}

	@Override
	public void updateOrderStatus(OrderBean orderBean) {
		sqlSession.update(namespace + ".updateOrderStatus", orderBean);
	}

	@Override
	public OrderBean getOrderInfo(int order_idx) {
		return sqlSession.selectOne(namespace + ".getOrderInfo", order_idx);
	}

}