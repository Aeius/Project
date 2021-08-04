package com.itwillbs.domain;

import java.util.List;

public class BasketBean {
	private String basket_email;
	private int basket_product_idx;
	private int basket_quantity;
	
	private int product_idx; 
	private String product_name;   
	private String	product_main_image; 
	private int product_price; 
	private int	product_size;
	
	private List<BasketBean> basketBean;

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
	public int getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_main_image() {
		return product_main_image;
	}
	public void setProduct_main_image(String product_main_image) {
		this.product_main_image = product_main_image;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getProduct_size() {
		return product_size;
	}
	public void setProduct_size(int product_size) {
		this.product_size = product_size;
	}
	public List<BasketBean> getBasketBean() {
		return basketBean;
	}
	public void setBasketBean(List<BasketBean> basketBean) {
		this.basketBean = basketBean;
	}
	
	
	
}
