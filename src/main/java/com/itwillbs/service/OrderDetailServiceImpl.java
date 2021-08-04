package com.itwillbs.service;

import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.OrderDetailDAO;
import com.itwillbs.domain.OrderDetailBean;

@Service
public class OrderDetailServiceImpl implements OrderDetailService {
	
	@Inject
	private OrderDetailDAO orderDetailDAO;
	
	@Override
	public ArrayList<OrderDetailBean> getOrderProductList(int order_idx) {
		return (ArrayList)orderDetailDAO.getOrderProductList(order_idx);
	}

	@Override
	public void insertOrderDetail(OrderDetailBean orderDetailBean) {
		orderDetailDAO.insertOrderDetail(orderDetailBean);
	}

}