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
	
	
	
	
	

}
