package com.itwillbs.dao;

import java.util.ArrayList;

import com.itwillbs.domain.MemberBean;
import com.itwillbs.domain.OrderBean;
import com.itwillbs.domain.OrderListBean;
import com.itwillbs.domain.PageBean;
import com.itwillbs.domain.ProductBean;

public interface OrderListDAO {
	
	ArrayList<OrderListBean> getOrderList(String order_member_email);

	OrderListBean getOrderMember(int order_idx);

	public void updateOrder(OrderListBean orederBListBean);

	ArrayList<OrderListBean> getOrderListPage(PageBean pb);

	public Integer getOrderListCount(String order_member_email);

	OrderListBean getReviewFind(String review_email);


}
