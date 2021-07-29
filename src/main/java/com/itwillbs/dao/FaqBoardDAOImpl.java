package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.FaqBoardBean;

@Repository
public class FaqBoardDAOImpl implements FaqBoardDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mapper.FaqBoardMapper";

	@Override
	public List<FaqBoardBean> getFaqList() {
		return sqlSession.selectList(namespace+".getFaqBoardList");
	}

	@Override
	public void insertFaqBoard(FaqBoardBean fbb) {
		System.out.println("FaqBoardDAOImpl - insertFaqBoard()");
		sqlSession.insert(namespace+".insertFaqBoard", fbb);
	}

	@Override
	public FaqBoardBean getFaqBoard(int faq_idx) {
		System.out.println("FaqBoardDAOImpl - getFaqBoard()");
		return sqlSession.selectOne(namespace+".getFaqBoard", faq_idx);
	}

	@Override
	public void updateFaqBoard(FaqBoardBean fbb) {
		sqlSession.update(namespace+".updateFaqBoard", fbb);
		
	}

	@Override
	public void deleteFaqBoard(FaqBoardBean fbb) {
		sqlSession.delete(namespace+".deleteFaqBoard", fbb);
	}

	@Override
	public List<FaqBoardBean> getFaqBoardList() {
		return sqlSession.selectList(namespace+".getFaqBoardList");
	}
	
	
}