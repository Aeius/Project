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
	public boolean intoBasket(BasketBean basketBean) {
		boolean isIntoBasket = false;
		int resultCount = 0;
		BasketBean basketBean2 = basketDAO.checkBasket(basketBean);
		if(basketBean2 != null) {
			resultCount = basketDAO.updateBasket(basketBean);
		} else {
			resultCount = basketDAO.intoBasket(basketBean);
		}
		if(resultCount > 0) {
			isIntoBasket = true;
		}
		return isIntoBasket;
	}

	@Override
	public List<BasketBean> getBasketList(String member_email) {
		return basketDAO.getBasketList(member_email);
	}

	@Override
	public int deleteBasket(String member_email, String product_idx) {
		return basketDAO.deleteBasket(member_email, product_idx);
	}

	@Override
	public boolean updateBasketQuantity(BasketBean basketBean) {
		boolean isUpdated = false;
		int updateCount = basketDAO.updateBasketQuantity(basketBean);
		if (updateCount > 0) {
			isUpdated = true;
		}
		return false;
	}
	
	

}