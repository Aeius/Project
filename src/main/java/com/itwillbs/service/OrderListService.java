package com.itwillbs.service;

import java.util.ArrayList;

import com.itwillbs.domain.MemberBean;
import com.itwillbs.domain.OrderListBean;
import com.itwillbs.domain.ProductBean;

public interface OrderListService {
	
	public ArrayList<OrderListBean> getOrderList(String order_member_email);


}
