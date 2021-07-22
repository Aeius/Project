package com.itwillbs.domain;

import java.sql.Date;

public class OrderBean {
	private int order_idx;
	private String order_member_email;
	private String order_receiver_name;
	private String receiver_name;
	private String receiver_phone;
	private int receiver_post;
	private String order_receiver_address;
	private String order_reveiver_extraAddress;
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
	public String getReceiver_name() {
		return receiver_name;
	}
	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}
	public String getReceiver_phone() {
		return receiver_phone;
	}
	public void setReceiver_phone(String receiver_phone) {
		this.receiver_phone = receiver_phone;
	}
	public int getReceiver_post() {
		return receiver_post;
	}
	public void setReceiver_post(int receiver_post) {
		this.receiver_post = receiver_post;
	}
	public String getOrder_receiver_address() {
		return order_receiver_address;
	}
	public void setOrder_receiver_address(String order_receiver_address) {
		this.order_receiver_address = order_receiver_address;
	}
	public String getOrder_reveiver_extraAddress() {
		return order_reveiver_extraAddress;
	}
	public void setOrder_reveiver_extraAddress(String order_reveiver_extraAddress) {
		this.order_reveiver_extraAddress = order_reveiver_extraAddress;
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
