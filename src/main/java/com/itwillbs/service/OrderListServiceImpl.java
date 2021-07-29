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
import com.itwillbs.domain.OrderBean;
import com.itwillbs.domain.OrderListBean;
import com.itwillbs.domain.PageBean;
import com.itwillbs.domain.ProductBean;

@Service
public class OrderListServiceImpl implements OrderListService {
	
	// xml에서 객체생성한것을 set 메서드를 통해서 부모인터페이스 멤버변수에 객체 생성한 것을 자동으로 전달 받기(Inject 사용)
	@Inject
	private OrderListDAO orderListDAO;
	@Override
	public ArrayList<OrderListBean> getOrderList(String order_member_email) {
		System.out.println("OrderListServiceImpl - getOrderList");
		return orderListDAO.getOrderList(order_member_email);
		
	}
	@Override
	public OrderListBean getOrderMember(int order_idx) {
		System.out.println("OrderListServiceImpl - getOrderMember");
		return orderListDAO.getOrderMember(order_idx);
	}
	@Override
	public void updateOrder(OrderListBean orederBListBean) {
		System.out.println("OrderListServiceImpl - updateOrder");
		orderListDAO.updateOrder(orederBListBean);
		
	}
	@Override
	public ArrayList<OrderListBean> getOrderListPage(PageBean pb) {
		// 페이지 관련 처리 pageNum, pageSize 담아옴
		// currentPage startRow-1 endRow 계산
		pb.setCurrentPage(Integer.parseInt(pb.getPageNum()));
		pb.setStartRow((pb.getCurrentPage()-1)*pb.getPageSize()+1-1);
//		pb.setEndPage(((pb.getCurrentPage()-1)*pb.getPageSize()+1)+pb.getPageSize()-1);
		
		System.out.println("OrderListServiceImpl - getOrderListPage");
		return orderListDAO.getOrderListPage(pb);
	}
	
	@Override
	public Integer getOrderListCount(String order_member_email) {
		System.out.println("ReviewServiceImpl-getOrderListCount");
		return orderListDAO.getOrderListCount(order_member_email);
	}


	

	

}
