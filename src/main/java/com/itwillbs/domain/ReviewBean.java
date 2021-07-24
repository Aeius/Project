package com.itwillbs.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class ReviewBean {
	
	private int review_idx;
	private String review_email;
	private int review_product_idx;
	private String review_subject;
	private String review_content;
	private String review_image;
	private int review_star;
	private Date member_date;
	
	public int getReview_idx() {
		return review_idx;
	}

	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}

	public String getReview_email() {
		return review_email;
	}

	public void setReview_email(String review_email) {
		this.review_email = review_email;
	}

	public int getReview_product_idx() {
		return review_product_idx;
	}

	public void setReview_product_idx(int review_product_idx) {
		this.review_product_idx = review_product_idx;
	}

	public String getReview_subject() {
		return review_subject;
	}

	public void setReview_subject(String review_subject) {
		this.review_subject = review_subject;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_image() {
		return review_image;
	}

	public void setReview_image(String review_image) {
		this.review_image = review_image;
	}

	public int getReview_star() {
		return review_star;
	}

	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}

	public Date getMember_date() {
		return member_date;
	}

	public void setMember_date(Date member_date) {
		this.member_date = member_date;
	}

	@Override
	public String toString() {
		return "ReviewBean [review_idx=" + review_idx + ", review_email=" + review_email + ", review_product_idx="
				+ review_product_idx + ", review_subject=" + review_subject + ", review_content=" + review_content
				+ ", review_image=" + review_image + ", review_star=" + review_star + ", member_date=" + member_date
				+ "]";
	}



	
}
