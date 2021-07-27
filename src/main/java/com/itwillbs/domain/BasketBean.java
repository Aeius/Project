package com.itwillbs.domain;

public class BasketBean {
	private String basket_email;
	private int basket_product_idx;
	private int basket_quantity;
	
	public String getBasket_email() {
		return basket_email;
	}
	public void setBasket_email(String basket_email) {
		this.basket_email = basket_email;
	}
	public int getBasket_product_idx() {
		return basket_product_idx;
	}
	public void setBasket_product_idx(int basket_product_idx) {
		this.basket_product_idx = basket_product_idx;
	}
	public int getBasket_quantity() {
		return basket_quantity;
	}
	public void setBasket_quantity(int basket_quantity) {
		this.basket_quantity = basket_quantity;
	}
	
	// 기본 생성자
	public BasketBean() {
		super();
	}
	// 모든 값 저장하는 생성자
	public BasketBean(String basket_email, int basket_product_idx, int basket_quantity) {
		super();
		this.basket_email = basket_email;
		this.basket_product_idx = basket_product_idx;
		this.basket_quantity = basket_quantity;
	}
	
	
}
