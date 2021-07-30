package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.BasketBean;

public interface BasketDAO {

	List<BasketBean> getBasketList(String member_email);

	int deleteBasket(String member_email, String product_idx);


}