package com.itwillbs.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.itwillbs.domain.NoticeBean;
import com.itwillbs.domain.ProductBean;

public interface AdminDAO {
	
	public void insertProduct(ProductBean productBean);

	public void insertNotice(NoticeBean noticeBean);

	public List<NoticeBean> getNoticeList();

	public void deleteNotice(int notice_idx);

	public NoticeBean getNotice(int notice_idx);


}
