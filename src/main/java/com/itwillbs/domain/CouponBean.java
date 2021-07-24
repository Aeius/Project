package com.itwillbs.domain;

import java.sql.Date;

public class CouponBean {
	private int coupon_idx;
	private String coupon_name;
	private int coupon_price;
	private boolean coupon_status;
	private Date coupon_date;
	private int coupon_expire;
	private Date coupon_expireDate;
	
	public int getCoupon_idx() {
		return coupon_idx;
	}
	public void setCoupon_idx(int coupon_idx) {
		this.coupon_idx = coupon_idx;
	}
	public String getCoupon_name() {
		return coupon_name;
	}
	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}
	public int getCoupon_price() {
		return coupon_price;
	}
	public void setCoupon_price(int coupon_price) {
		this.coupon_price = coupon_price;
	}
	public boolean isCoupon_status() {
		return coupon_status;
	}
	public void setCoupon_status(boolean coupon_status) {
		this.coupon_status = coupon_status;
	}
	public Date getCoupon_date() {
		return coupon_date;
	}
	public void setCoupon_date(Date coupon_date) {
		this.coupon_date = coupon_date;
	}
	public int getCoupon_expire() {
		return coupon_expire;
	}
	public void setCoupon_expire(int coupon_expire) {
		this.coupon_expire = coupon_expire;
	}
	public Date getCoupon_expireDate() {
		return coupon_expireDate;
	}
	public void setCoupon_expireDate(Date coupon_expireDate) {
		this.coupon_expireDate = coupon_expireDate;
	}
	
	@Override
	public String toString() {
		return "CouponBean [coupon_idx=" + coupon_idx + ", coupon_name=" + coupon_name + ", coupon_price="
				+ coupon_price + ", coupon_status=" + coupon_status + ", coupon_date=" + coupon_date
				+ ", coupon_expire=" + coupon_expire + ", coupon_expireDate=" + coupon_expireDate + "]";
	}

}
