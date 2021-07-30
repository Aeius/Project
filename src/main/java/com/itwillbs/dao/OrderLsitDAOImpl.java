package com.itwillbs.dao;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberBean;
import com.itwillbs.domain.OrderBean;
import com.itwillbs.domain.OrderListBean;
import com.itwillbs.domain.PageBean;
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
		System.out.println("OrderLsitDAOImpl - getOrderList" );
		return (ArrayList)sqlSession.selectList(namespace+".getOrderList",order_member_email);
	}

	@Override
	public OrderListBean getOrderMember(int order_idx) {
		System.out.println("OrderLsitDAOImpl - getOrderMember" );
		return sqlSession.selectOne(namespace+".getOrderMember",order_idx);
	}

	@Override
	public void updateOrder(OrderListBean orederBListBean) {
		System.out.println("ReviewDAOImpl-updateOrder");
		sqlSession.update(namespace + ".updateOrder", orederBListBean);
		
	}

	@Override
	public ArrayList<OrderListBean> getOrderListPage(PageBean pb) {
		System.out.println("OrderLsitDAOImpl - getOrderListPage" );
		return (ArrayList)sqlSession.selectList(namespace+".getOrderListPage",pb);
	}

	@Override
	public Integer getOrderListCount(String order_member_email) {
		System.out.println("ReviewDAOImpl-getOrderListCount");
		return sqlSession.selectOne(namespace+".getOrderListCount",order_member_email);
	}


	@Override
	public OrderListBean getReviewFind(String review_email) {
		System.out.println("OrderLsitDAOImpl - getReviewFind" );
		return sqlSession.selectOne(namespace+".getReviewFind",review_email);
	}

//	@Override
//	public OrderListBean getReviewCheck1(int review_idx) {
//		System.out.println("OrderLsitDAOImpl - getReviewCheck1" );
//		return sqlSession.selectOne(namespace+".getReviewCheck1",review_idx);
//	}

//	@Override
//	public OrderListBean getReviewCheck(String review_email, int review_idx) {
//		System.out.println("OrderLsitDAOImpl - getReviewCheck" );
//		return sqlSession.selectOne(namespace+".getReviewCheck",review_email,review_idx);
//	}


	

	
	
}
