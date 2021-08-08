package com.itwillbs.service;

public interface CategoryService {

	public void addManCount(String recoCategory); // 남자 추천 결과 

	public void addWomanCount(String recoCategory); // 여자 추천 결과 +1

	public void addNonCount(String recoCategory); // 성별무관 추천 결과 +1

}
