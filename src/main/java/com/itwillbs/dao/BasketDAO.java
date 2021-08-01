package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.BasketBean;

public interface BasketDAO {
	
	public int intoBasket(BasketBean basketBean);
	
	public BasketBean checkBasket(BasketBean basketBean);

	public int updateBasket(BasketBean basketBean);

	public List<BasketBean> getBasketList(String member_email);

	public int deleteBasket(String member_email, String product_idx);

	public int updateBasketQuantity(BasketBean basketBean);


}