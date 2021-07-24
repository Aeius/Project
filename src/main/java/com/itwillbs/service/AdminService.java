package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.NoticeBean;
import com.itwillbs.domain.ProductBean;

public interface AdminService {

	public void insertProduct(ProductBean productBean);

	public void insertNotice(NoticeBean noticeBean);

	public List<NoticeBean> getNoticeList();


}
