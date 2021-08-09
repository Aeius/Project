package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.BasketBean;
import com.itwillbs.domain.CouponBean;
import com.itwillbs.domain.MemberBean;

public interface BasketService {

	public List<BasketBean> getBasketList(String member_email);

	public int deleteBasket(String member_email, String product_idx);
	
	public boolean intoBasket(BasketBean basketBean);

	public boolean updateBasketQuantity(BasketBean basketBean);

	public List<CouponBean> getMemberCouponList(String member_email);

	public void deleteBasketList(MemberBean memberBean);


}