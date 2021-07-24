package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.dao.OrderDAO;
import com.itwillbs.dao.OrderListDAO;
import com.itwillbs.dao.ProductDAO;
import com.itwillbs.domain.MemberBean;
import com.itwillbs.domain.OrderListBean;
import com.itwillbs.domain.ProductBean;

@Service
public class OrderListServiceImpl implements OrderListService {
	
	// xml에서 객체생성한것을 set 메서드를 통해서 부모인터페이스 멤버변수에 객체 생성한 것을 자동으로 전달 받기(Inject 사용)
	@Inject
	private OrderListDAO orderListDAO;
	@Override
	public ArrayList<OrderListBean> getOrderList(String order_member_email) {
		System.out.println("OrderListServiceImpl");
		return orderListDAO.getOrderList(order_member_email);
		
	}


	

	

}
