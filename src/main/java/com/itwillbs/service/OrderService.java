package com.itwillbs.service;

import java.util.ArrayList;

import com.itwillbs.domain.OrderBean;

public interface OrderService {

	public ArrayList<OrderBean> getOrderAllList();

	public OrderBean getOrderDetail(int order_idx);

}