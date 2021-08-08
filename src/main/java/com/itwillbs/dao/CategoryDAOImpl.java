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
	public void addManCount(String recoCategory) {
		sqlSession.update(namespace + ".addManCount", recoCategory);
	}

	@Override
	public void addWomanCount(String recoCategory) {
		sqlSession.update(namespace + ".addWomanCount", recoCategory);
	}

	@Override
	public void addNonCount(String recoCategory) {
		sqlSession.update(namespace + ".addNonCount", recoCategory);
	}
	
	
}
