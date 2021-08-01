package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.BasketBean;

public interface BasketService {

	public List<BasketBean> getBasketList(String member_email);

	public int deleteBasket(String member_email, String product_idx);
	
	public boolean intoBasket(BasketBean basketBean);

	public boolean updateBasketQuantity(BasketBean basketBean);


}