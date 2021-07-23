package com.itwillbs.dao;

import java.util.ArrayList;

import com.itwillbs.domain.OrderBean;

public interface OrderDAO {

	public ArrayList<OrderBean> getOrderAllList();

	public OrderBean getOrderDetail(int order_idx);
	
}