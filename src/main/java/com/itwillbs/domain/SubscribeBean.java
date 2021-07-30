package com.itwillbs.domain;

import java.sql.Date;

public class SubscribeBean {
	
	private String subscribe_email;
	private Date subscribe_start_date;
	private int subscribe_month;
	
	
	public String getSubscribe_email() {
		return subscribe_email;
	}
	public void setSubscribe_email(String subscribe_email) {
		this.subscribe_email = subscribe_email;
	}
	public Date getSubscribe_start_date() {
		return subscribe_start_date;
	}
	public void setSubscribe_start_date(Date subscribe_start_date) {
		this.subscribe_start_date = subscribe_start_date;
	}
	public int getSubscribe_month() {
		return subscribe_month;
	}
	public void setSubscribe_month(int subscribe_month) {
		this.subscribe_month = subscribe_month;
	}
	
//	@Override
//	public String toString() {
//		return "SubscribeBean [subscribe_email=" + subscribe_email + "]";
//	}
}
