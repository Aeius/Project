package com.itwillbs.domain;

import java.sql.Timestamp;

public class NoticeBean {
	private int notice_idx;
	private String notice_name;
	private String notice_subject;
	private String notice_content;
	private String notice_file_original;
	private String noice_file_real;
	private int notece_readcount;
	private Timestamp notice_date;
	
	
	public int getNotice_idx() {
		return notice_idx;
	}
	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}
	public String getNotice_name() {
		return notice_name;
	}
	public void setNotice_name(String notice_name) {
		this.notice_name = notice_name;
	}
	public String getNotice_subject() {
		return notice_subject;
	}
	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_file_original() {
		return notice_file_original;
	}
	public void setNotice_file_original(String notice_file_original) {
		this.notice_file_original = notice_file_original;
	}
	public String getNoice_file_real() {
		return noice_file_real;
	}
	public void setNoice_file_real(String noice_file_real) {
		this.noice_file_real = noice_file_real;
	}
	public int getNotece_readcount() {
		return notece_readcount;
	}
	public void setNotece_readcount(int notece_readcount) {
		this.notece_readcount = notece_readcount;
	}
	public Timestamp getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Timestamp notice_date) {
		this.notice_date = notice_date;
	}
	
}
