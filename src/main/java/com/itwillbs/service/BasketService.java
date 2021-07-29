package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.BasketBean;

public interface BasketService {

	List<BasketBean> getBasketList(String member_email);

}