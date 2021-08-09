package com.itwillbs.service;

import java.util.ArrayList;

import com.itwillbs.domain.CouponBean;
import com.itwillbs.domain.OrderDetailBean;

public interface OrderDetailService {

	public ArrayList<OrderDetailBean> getOrderProductList(int order_idx);

	public void insertOrderDetail(OrderDetailBean orderDetailBean);

	public CouponBean getCouponInfo(int coupon_idx);
	
}