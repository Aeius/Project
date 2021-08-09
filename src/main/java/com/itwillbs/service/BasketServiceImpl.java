package com.itwillbs.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.BasketDAO;
import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.BasketBean;
import com.itwillbs.domain.CouponBean;
import com.itwillbs.domain.MemberBean;

@Service
public class BasketServiceImpl implements BasketService {

	@Inject
	private BasketDAO basketDAO;
	
	@Inject
	private MemberDAO memberDAO;
	
	// -------------------------------------------------- 장바구니 담기 -------------------------------------------------- 
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
	
	// -------------------------------------------------- 장바구니 가져오기 -------------------------------------------------- 
	@Override
	public List<BasketBean> getBasketList(String member_email) {
		return basketDAO.getBasketList(member_email);
	}
	
	// -------------------------------------------------- 장바구니 삭제 -------------------------------------------------- 
	@Override
	public int deleteBasket(String member_email, String product_idx) {
		return basketDAO.deleteBasket(member_email, product_idx);
	}
	
	// -------------------------------------------------- (장바구니) 수량 변경 -------------------------------------------------- 
	@Override
	public boolean updateBasketQuantity(BasketBean basketBean) {
		boolean isUpdated = false;
		int updateCount = basketDAO.updateBasketQuantity(basketBean);
		if (updateCount > 0) {
			isUpdated = true;
		}
		return isUpdated;
	}

	// -------------------------------------------------- (장바구니) 고객 쿠폰 정보 가져오기 -------------------------------------------------- 
	@Override
	public List<CouponBean> getMemberCouponList(String member_email) {
		// 고객 보유 쿠폰 가져오기 
		String[] arrStrMemberCoupon;
		// 고객 보유 쿠폰 정보 담을 List 객체 선언
		ArrayList<CouponBean> couponInfoList = null;
		
		try {
			arrStrMemberCoupon = memberDAO.getMemberCouponList(member_email).split("/");
			if(arrStrMemberCoupon == null) {
				return couponInfoList;
			} else {
				couponInfoList = new ArrayList<CouponBean>();
				// 분리한 고객 보유 쿠폰 번호 하나씩 조회해서 객체에 담기
				for(String memberCoupon : arrStrMemberCoupon) {
					couponInfoList.add(memberDAO.getCouponInfo(Integer.parseInt(memberCoupon)));
				}
			}
			
		} catch (Exception e) {
			return couponInfoList;
		}
		
		return couponInfoList;
	}

	@Override
	public void deleteBasketList(MemberBean memberBean) {
		basketDAO.deleteBasketList(memberBean);
	}
	
	
	

}