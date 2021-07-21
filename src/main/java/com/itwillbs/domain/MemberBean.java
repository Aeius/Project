package com.itwillbs.domain;

import java.sql.Timestamp;

public class MemberBean {
	// 자바빈 : member 데이터를 담아서 전달
	// 멤버변수
	// 멤버변수에 아무나 접근 못하게 막아줌 => 은닉 캡슐화
	private String id;
	private String pass;
	private String name;
	private Timestamp date;
	
	// 멤버함수(메서드)
	// 멤버변수를 접근할수 있는 메서드 만들어 줌
	// public 외부접근 값을 저장, 값을 가져오는 메서드 정의
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	

	
	
}
