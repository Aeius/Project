package com.itwillbs.domain;

public class OrderDetailBean {
	
	private int order_detail_order_idx;
	private int order_detail_product_idx;
	private int order_detail_product_quantity;
	
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