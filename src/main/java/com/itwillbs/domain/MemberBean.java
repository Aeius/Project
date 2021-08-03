package com.itwillbs.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class MemberBean {
	private String member_email;
	private String member_email2;
	private int member_idx;
	private String member_password;
	private String member_name;
	private String member_phone;
	private int member_post;
	private String member_address;
	private String member_extraAddress;
	private String member_extraAddress2;
	private Date member_date;
	private String member_coupon;
	private String member_like;
	private boolean member_subscribe;
	private int member_point;
	
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_email2() {
		return member_email2;
	}
	public void setMember_email2(String member_email2) {
		this.member_email2 = member_email2;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public int getMember_post() {
		return member_post;
	}
	public void setMember_post(int member_post) {
		this.member_post = member_post;
	}
	public String getMember_address() {
		return member_address;
	}
	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}
	public String getMember_extraAddress() {
		return member_extraAddress;
	}
	public void setMember_extraAddress(String member_extraAddress) {
		this.member_extraAddress = member_extraAddress;
	}
	public String getMember_extraAddress2() {
		return member_extraAddress2;
	}
	public void setMember_extraAddress2(String member_extraAddress2) {
		this.member_extraAddress2 = member_extraAddress2;
	}
	public Date getMember_date() {
		return member_date;
	}
	public void setMember_date(Date member_date) {
		this.member_date = member_date;
	}
	public String getMember_coupon() {
		return member_coupon;
	}
	public void setMember_coupon(String member_coupon) {
		this.member_coupon = member_coupon;
	}
	public String getMember_like() {
		return member_like;
	}
	public void setMember_like(String member_like) {
		this.member_like = member_like;
	}
	public boolean isMember_subscribe() {
		return member_subscribe;
	}
	public void setMember_subscribe(boolean member_subscribe) {
		this.member_subscribe = member_subscribe;
	}
	public int getMember_point() {
		return member_point;
	}
	public void setMember_point(int member_point) {
		this.member_point = member_point;
	}
	@Override
	public String toString() {
		return "MemberBean [member_email=" + member_email + ", member_idx=" + member_idx + ", member_password="
				+ member_password + ", member_name=" + member_name + ", member_phone=" + member_phone + ", member_post="
				+ member_post + ", member_address=" + member_address + ", member_extraAddress=" + member_extraAddress
				+ ", member_extraAddress2=" + member_extraAddress2 + ", member_date=" + member_date + ", member_coupon="
				+ member_coupon + ", member_like=" + member_like + ", member_subscribe=" + member_subscribe
				+ ", member_point=" + member_point + "]";
	}
	
}
