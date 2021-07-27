package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.itwillbs.dao.AdminDAO;
import com.itwillbs.domain.CouponBean;
import com.itwillbs.domain.NoticeBean;
import com.itwillbs.domain.ProductBean;
import com.itwillbs.domain.ReviewBean;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO adminDAO;
	
	@Override
	public void insertNotice(NoticeBean noticeBean) {
		adminDAO.insertNotice(noticeBean);
	}

	@Override
	public List<NoticeBean> getNoticeList() {
		return adminDAO.getNoticeList();
	}

	@Override
	public void deleteNotice(int notice_idx) {
		adminDAO.deleteNotice(notice_idx);
	}

	@Override
	public NoticeBean getNotice(int notice_idx) {
		return adminDAO.getNotice(notice_idx);
	}

	@Override
	public void noticeUpdate(NoticeBean nb) {
		adminDAO.noticeUpdate(nb);
	}

	@Override
	public List<ReviewBean> getReviewList() {
		return adminDAO.getReviewList();
	}

	@Override
	public void deleteReview(int review_idx) {
		adminDAO.deleteReview(review_idx);
	}

	@Override
	public List<CouponBean> getCouponList() {
		return adminDAO.getCouponList();
	}

	@Override
	public void expireCoupon(int coupon_idx) {
		adminDAO.expireCoupon(coupon_idx);
	}

	@Override
	public void unexpireCoupon(int coupon_idx) {
		adminDAO.unexpireCoupon(coupon_idx);
	}


}
