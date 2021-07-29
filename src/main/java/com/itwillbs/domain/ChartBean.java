package com.itwillbs.domain;

import java.sql.Date;

public class ChartBean {
	// 차트 표시용 데이터
	private int order_amount;
	private Date order_date;
	
	public int getOrder_amount() {
		return order_amount;
	}
	public void setOrder_amount(int order_amount) {
		this.order_amount = order_amount;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
}
