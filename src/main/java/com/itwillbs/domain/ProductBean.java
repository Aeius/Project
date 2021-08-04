package com.itwillbs.domain;

public class ProductBean {
	private int product_idx; 
	private String product_name;   
	private String product_category ;
	private String product_detail; 
	private String	product_main_image; 
	private String	product_detail_image; // 디테일 하나로 변경
	private int product_price; 
	private int	product_size; 
	private int	product_stock ;
	private int	product_likecount; 
	private int	product_sellcount;
	private boolean product_status;
	private String product_quantity;
	
	
	
	
	public String getProduct_quantity() {
		return product_quantity;
	}
	public void setProduct_quantity(String product_quantity) {
		this.product_quantity = product_quantity;
	}
	public boolean isProduct_status() {
		return product_status;
	}
	public void setProduct_status(boolean product_status) {
		this.product_status = product_status;
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
	public String getProduct_category() {
		return product_category;
	}
	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}
	public String getProduct_detail() {
		return product_detail;
	}
	public void setProduct_detail(String product_detail) {
		this.product_detail = product_detail;
	}
	public String getProduct_main_image() {
		return product_main_image;
	}
	public void setProduct_main_image(String product_main_image) {
		this.product_main_image = product_main_image;
	}
	public String getProduct_detail_image() {
		return product_detail_image;
	}
	public void setProduct_detail_image(String product_detail_image) {
		this.product_detail_image = product_detail_image;
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
	public int getProduct_stock() {
		return product_stock;
	}
	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}
	public int getProduct_likecount() {
		return product_likecount;
	}
	public void setProduct_likecount(int product_likecount) {
		this.product_likecount = product_likecount;
	}
	public int getProduct_sellcount() {
		return product_sellcount;
	}
	public void setProduct_sellcount(int product_sellcount) {
		this.product_sellcount = product_sellcount;
	}
}
