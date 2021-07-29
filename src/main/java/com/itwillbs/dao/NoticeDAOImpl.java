package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.NoticeBean;
import com.itwillbs.domain.PageBean;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mapper.NoticeMapper";

	@Override
	public List<NoticeBean> getNoticeList() {
		return sqlSession.selectList(namespace+".getNoticeList");
	}

	@Override
	public NoticeBean getNoticeDetail(int notice_idx) {
		return sqlSession.selectOne(namespace + ".getNoticeDetail",notice_idx);
	}

	@Override
	public List<NoticeBean> getNoticeList(PageBean pb) {
		System.out.println("pb의 pageSize"+ pb.getPageSize());
		return sqlSession.selectList(namespace+".getNoticeList2", pb);
	}

	@Override
	public Integer getNoticeCount() {

		return sqlSession.selectOne(namespace+".getNoticeCount");
	} 

}