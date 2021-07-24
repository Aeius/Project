package com.itwillbs.domain;

import java.sql.Date;

public class OrderListBean {
	
	private int order_idx;
	private String product_name;
    private String order_status;
    private int order_detail_order_idx;
    private String order_memeber_email;
    
	public int getOrder_idx() {
		return order_idx;
	}
	public void setOrder_idx(int order_idx) {
		this.order_idx = order_idx;
	}
	public int getOrder_detail_order_idx() {
		return order_detail_order_idx;
	}
	public void setOrder_detail_order_idx(int order_detail_order_idx) {
		this.order_detail_order_idx = order_detail_order_idx;
	}
	public String getOrder_memeber_email() {
		return order_memeber_email;
	}
	public void setOrder_memeber_email(String order_memeber_email) {
		this.order_memeber_email = order_memeber_email;
	}
	
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
}
