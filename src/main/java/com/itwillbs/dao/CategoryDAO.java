package com.itwillbs.dao;

public interface CategoryDAO {
	
	public void addCount(String[] category);
	
	public void minusCount(String[] preCategory);

	public void addManCount(String recoCategory);
	
	public void addWomanCount(String recoCategory);
	
	public void addNonCount(String recoCategory); 
	
}
