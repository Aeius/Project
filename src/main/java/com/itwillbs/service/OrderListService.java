package com.itwillbs.service;

import java.util.ArrayList;

import com.itwillbs.domain.MemberBean;
import com.itwillbs.domain.OrderBean;
import com.itwillbs.domain.OrderListBean;
import com.itwillbs.domain.PageBean;
import com.itwillbs.domain.ProductBean;

public interface OrderListService {
	
	public ArrayList<OrderListBean> getOrderList(String order_member_email);

	public OrderListBean getOrderMember(int order_idx);

	public void updateOrder(OrderListBean orederBListBean);

	public ArrayList<OrderListBean> getOrderListPage(PageBean pb);

	public Integer getOrderListCount(String order_member_email);

//	public OrderListBean getReviewCheck(String review_email, int review_idx);

	ArrayList<OrderListBean> getReviewFind(String review_email);

//	public OrderListBean getReviewCheck1(int review_idx);

}
