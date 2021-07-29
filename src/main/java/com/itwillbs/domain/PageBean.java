package com.itwillbs.domain;

public class PageBean {
	private int pageSize;
	private String pageNum;
	private int currentPage;
	private int startRow;
	private int endRow;
	
	private int pageBlock;
	private int startPage;
	private int endPage;
	private int count;
	private int pageCount;
	
	private String order_member_email;
	
	public String getOrder_member_email() {
		return order_member_email;
	}
	public void setOrder_member_email(String order_member_email) {
		this.order_member_email = order_member_email;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String getPageNum() {
		return pageNum;
	}
	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getPageBlock() {
		return pageBlock;
	}
	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
		// 페이지 관련 정보 계산
		init();
	}
	public void init() {
		// 한화면에 보여지는 페이지 수 설정
		pageBlock=10;
		//한화면에 보여지는 시작페이지 번호 구하기
		startPage=(currentPage-1)/pageBlock*pageBlock+1;
		// 한화면에 보여지는 끝페이지 번호 구하기
		endPage=startPage+pageBlock-1;
		// 전체 페이지 수 구하기 
		pageCount=count/pageSize+(count%pageSize==0?0:1);
		
		if(endPage > pageCount){
			endPage=pageCount;
	    }
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	
	
}
