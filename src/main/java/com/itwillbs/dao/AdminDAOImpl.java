package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.CouponBean;
import com.itwillbs.domain.NoticeBean;
import com.itwillbs.domain.ProductBean;
import com.itwillbs.domain.ReviewBean;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.itwillbs.mapper.AdminMapper";

	@Override
	public void insertNotice(NoticeBean noticeBean) {
		sqlSession.insert(namespace + ".insertNotice", noticeBean);
	}

	@Override
	public List<NoticeBean> getNoticeList() {
		return sqlSession.selectList(namespace + ".getNoticeList");
	}

	@Override
	public void deleteNotice(int notice_idx) {
		sqlSession.delete(namespace + ".deleteNotice", notice_idx);
	}

	@Override
	public NoticeBean getNotice(int notice_idx) {
		return sqlSession.selectOne(namespace + ".getNotice", notice_idx);
	}

	@Override
	public void noticeUpdate(NoticeBean nb) {
		sqlSession.update(namespace + ".noticeUpdate", nb);
	}

	@Override
	public List<ReviewBean> getReviewList() {
		return sqlSession.selectList(namespace + ".getReviewList");
	}

	@Override
	public void deleteReview(int review_idx) {
		sqlSession.delete(namespace + ".deleteReview", review_idx);
	}

	@Override
	public List<CouponBean> getCouponList() {
		return sqlSession.selectList(namespace + ".getCouponList");
	}

	@Override
	public void expireCoupon(int coupon_idx) {
		sqlSession.update(namespace + ".expireCoupon", coupon_idx);
	}

	@Override
	public void unexpireCoupon(int coupon_idx) {
		sqlSession.update(namespace + ".unexpireCoupon", coupon_idx);
	}

	@Override
	public void couponAddPro(CouponBean couponBean) {
		sqlSession.insert(namespace + ".couponAddPro", couponBean);
	}

	@Override
	public void couponActivateInOnce() {
		sqlSession.update(namespace + ".couponActivateInOnce");
	}

	@Override
	public void couponExpireInOnce() {
		sqlSession.update(namespace + ".couponExpireInOnce");
	}

	@Override
	public ReviewBean getReview(int review_idx) {
		return sqlSession.selectOne(namespace + ".getReview", review_idx);
	}
	
	
}
