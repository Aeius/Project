package com.itwillbs.domain;

import java.sql.Date;

public class OrderBean {
	private int order_idx;
	private String order_member_email;
	private String order_receiver_name;
	private String order_receiver_phone;
	private int order_receiver_post;
	private String order_receiver_address;
	private String order_receiver_extraAddress;
	private String order_receiver_extraAddress2;
	private int order_amount;
	private int order_coupon;
	private int order_point;
	private String order_status;
	private Date order_date;
	private String order_payment;
	private int order_tracking_num;
	
	public int getOrder_idx() {
		return order_idx;
	}
	public void setOrder_idx(int order_idx) {
		this.order_idx = order_idx;
	}
	public String getOrder_member_email() {
		return order_member_email;
	}
	public void setOrder_member_email(String order_member_email) {
		this.order_member_email = order_member_email;
	}
	public String getOrder_receiver_name() {
		return order_receiver_name;
	}
	public void setOrder_receiver_name(String order_receiver_name) {
		this.order_receiver_name = order_receiver_name;
	}
	public String getOrder_receiver_phone() {
		return order_receiver_phone;
	}
	public void setOrder_receiver_phone(String order_receiver_phone) {
		this.order_receiver_phone = order_receiver_phone;
	}
	public int getOrder_receiver_post() {
		return order_receiver_post;
	}
	public void setOrder_receiver_post(int order_receiver_post) {
		this.order_receiver_post = order_receiver_post;
	}
	public String getOrder_receiver_address() {
		return order_receiver_address;
	}
	public void setOrder_receiver_address(String order_receiver_address) {
		this.order_receiver_address = order_receiver_address;
	}
	public String getOrder_receiver_extraAddress() {
		return order_receiver_extraAddress;
	}
	public void setOrder_receiver_extraAddress(String order_receiver_extraAddress) {
		this.order_receiver_extraAddress = order_receiver_extraAddress;
	}
	public String getOrder_receiver_extraAddress2() {
		return order_receiver_extraAddress2;
	}
	public void setOrder_receiver_extraAddress2(String order_receiver_extraAddress2) {
		this.order_receiver_extraAddress2 = order_receiver_extraAddress2;
	}
	public int getOrder_amount() {
		return order_amount;
	}
	public void setOrder_amount(int order_amount) {
		this.order_amount = order_amount;
	}
	public int getOrder_coupon() {
		return order_coupon;
	}
	public void setOrder_coupon(int order_coupon) {
		this.order_coupon = order_coupon;
	}
	public int getOrder_point() {
		return order_point;
	}
	public void setOrder_point(int order_point) {
		this.order_point = order_point;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getOrder_payment() {
		return order_payment;
	}
	public void setOrder_payment(String order_payment) {
		this.order_payment = order_payment;
	}
	public int getOrder_tracking_num() {
		return order_tracking_num;
	}
	public void setOrder_tracking_num(int order_tracking_num) {
		this.order_tracking_num = order_tracking_num;
	}
	
}