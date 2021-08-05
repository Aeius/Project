package com.itwillbs.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.itwillbs.domain.CouponBean;
import com.itwillbs.domain.NoticeBean;
import com.itwillbs.domain.ProductBean;
import com.itwillbs.domain.ReviewBean;

public interface AdminService {

	public void insertNotice(NoticeBean noticeBean);

	public List<NoticeBean> getNoticeList();

	public void deleteNotice(int notice_idx);

	public NoticeBean getNotice(int notice_idx);

	public void noticeUpdate(NoticeBean nb);

	public List<ReviewBean> getReviewList();

	public void deleteReview(int review_idx);

	public List<CouponBean> getCouponList();

	public void expireCoupon(int coupon_idx);

	public void unexpireCoupon(int coupon_idx);

	public void couponAddPro(CouponBean couponBean);

	public void couponActivateInOnce();

	public void couponExpireInOnce();

	public ReviewBean getReview(int review_idx);


	
}
