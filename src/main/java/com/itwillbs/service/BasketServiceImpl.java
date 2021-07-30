package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.BasketDAO;
import com.itwillbs.domain.BasketBean;

@Service
public class BasketServiceImpl implements BasketService {

	@Inject
	private BasketDAO basketDAO;

	@Override
	public List<BasketBean> getBasketList(String member_email) {
		return basketDAO.getBasketList(member_email);
	}

	@Override
	public int deleteBasket(String member_email, String product_idx) {
		return basketDAO.deleteBasket(member_email, product_idx);
	}
	
	

}