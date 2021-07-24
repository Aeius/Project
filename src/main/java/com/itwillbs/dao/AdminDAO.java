package com.itwillbs.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.itwillbs.domain.NoticeBean;
import com.itwillbs.domain.ProductBean;

public interface AdminDAO {
	
	public void insertProduct(ProductBean productBean);

	public void insertNotice(NoticeBean noticeBean);

	public List<NoticeBean> getNoticeList();

}
