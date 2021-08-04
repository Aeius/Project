package com.itwillbs.dao;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.OrderDetailBean;

@Repository
public class OrderDetailDAOImpl implements OrderDetailDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mapper.OrderDetailMapper";
	
	@Override
	public ArrayList<OrderDetailBean> getOrderProductList(int order_idx) {
		return (ArrayList)sqlSession.selectList(namespace + ".getOrderProductList", order_idx);
	}

	@Override
	public void insertOrderDetail(OrderDetailBean orderDetailBean) {
		sqlSession.insert(namespace + ".insertOrderDetail", orderDetailBean);
	}

}