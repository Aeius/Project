package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDAOImpl implements CategoryDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mapper.CategoryMapper";

	@Override
	public void addCount(String[] category) {
		// category 배열에서 하나씩 꺼내서 해당 카테고리 addCount 반복
		for(String category_name : category) { 
			sqlSession.update(namespace + ".addCount", category_name);
		}
	}

	@Override
	public void minusCount(String[] preCategory) {
		// category 배열에서 하나씩 꺼내서 해당 카테고리 minusCount 반복
		for(String category_name : preCategory) { 
			sqlSession.update(namespace + ".minusCount", category_name);
		}
	}
	
	
}
