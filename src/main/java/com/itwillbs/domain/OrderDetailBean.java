package com.itwillbs.domain;

public class OrderDetailBean {
	
	private int order_detail_order_idx;
	private int order_detail_product_idx;
	private int order_detail_product_quantity;
	private String order_detail_return_check;
	
	
	
	public String getOrder_detail_return_check() {
		return order_detail_return_check;
	}
	public void setOrder_detail_return_check(String order_detail_return_check) {
		this.order_detail_return_check = order_detail_return_check;
	}
	public int getOrder_detail_order_idx() {
		return order_detail_order_idx;
	}
	public void setOrder_detail_order_idx(int order_detail_order_idx) {
		this.order_detail_order_idx = order_detail_order_idx;
	}
	public int getOrder_detail_product_idx() {
		return order_detail_product_idx;
	}
	public void setOrder_detail_product_idx(int order_detail_product_idx) {
		this.order_detail_product_idx = order_detail_product_idx;
	}
	public int getOrder_detail_product_quantity() {
		return order_detail_product_quantity;
	}
	public void setOrder_detail_product_quantity(int order_detail_product_quantity) {
		this.order_detail_product_quantity = order_detail_product_quantity;
	}
	
}