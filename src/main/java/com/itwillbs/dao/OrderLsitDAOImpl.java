package com.itwillbs.dao;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberBean;
import com.itwillbs.domain.OrderListBean;
import com.itwillbs.domain.ProductBean;

@Repository
public class OrderLsitDAOImpl implements OrderListDAO {
	
	// 마이바티스 객체생성(생성자를 통해서 자동주입)
	@Inject
	private SqlSession sqlSession;
	
	// sql 구문 전체 이름 변수 정의
	private static final String namespace = "com.itwillbs.mapper.OrderListMapper";

	@Override
	public ArrayList<OrderListBean> getOrderList(String order_member_email) {
		System.out.println("OrderLsitDAOImpl");
		return (ArrayList)sqlSession.selectList(namespace+".getOrderList",order_member_email);
	}
	

	
	
}
