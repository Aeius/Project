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
	private String search;
	
	private String Order_member_email;
	private String member_email;
	private int Product_idx;
	
	
	public int getProduct_idx() {
		return Product_idx;
	}
	public void setProduct_idx(int product_idx) {
		Product_idx = product_idx;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getOrder_member_email() {
		return Order_member_email;
	}
	public void setOrder_member_email(String order_member_email) {
		Order_member_email = order_member_email;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
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
		// ????????? ?????? ?????? ??????
		init();
	}
	public void init() {
		// ???????????? ???????????? ????????? ??? ??????
		pageBlock=10;
		//???????????? ???????????? ??????????????? ?????? ?????????
		startPage=(currentPage-1)/pageBlock*pageBlock+1;
		// ???????????? ???????????? ???????????? ?????? ?????????
		endPage=startPage+pageBlock-1;
		// ?????? ????????? ??? ????????? 
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