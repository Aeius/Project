package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.NoticeBean;
import com.itwillbs.domain.ProductBean;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.itwillbs.mapper.AdminMapper";

	@Override
	public void insertProduct(ProductBean productBean) {
		sqlSession.insert(namespace + ".insertProduct", productBean);
	}

	@Override
	public void insertNotice(NoticeBean noticeBean) {
		sqlSession.insert(namespace + ".insertNotice", noticeBean);
	}

	@Override
	public List<NoticeBean> getNoticeList() {
		return sqlSession.selectList(namespace+".getNoticeList");
	}
	
}
