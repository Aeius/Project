package com.itwillbs.service;

import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.OrderDAO;
import com.itwillbs.domain.OrderBean;

@Service
public class OrderServiceImpl implements OrderService {

	@Inject
	private OrderDAO orderDAO;
	
	@Override
	public ArrayList<OrderBean> getOrderAllList() {
		return (ArrayList)orderDAO.getOrderAllList();
	}

	@Override
	public OrderBean getOrderDetail(int order_idx) {
		return orderDAO.getOrderDetail(order_idx);
	}

	@Override
	public OrderBean getOrderInfo(int order_idx) {
		return orderDAO.getOrderInfo(order_idx);
	}

	@Override
	public void updateOrderStatus(OrderBean orderBean) {
		orderDAO.updateOrderStatus(orderBean);
	}

	
	
	

}