package com.itwillbs.service;

import java.util.ArrayList;

import com.itwillbs.domain.OrderDetailBean;

public interface OrderDetailService {

	public ArrayList<OrderDetailBean> getOrderProductList(int order_idx);

}