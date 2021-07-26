package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.itwillbs.dao.AdminDAO;
import com.itwillbs.domain.NoticeBean;
import com.itwillbs.domain.ProductBean;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO adminDAO;
	
	@Override
	public void insertProduct(ProductBean productBean) {
		adminDAO.insertProduct(productBean);
	}

	@Override
	public void insertNotice(NoticeBean noticeBean) {
		adminDAO.insertNotice(noticeBean);
	}

	@Override
	public List<NoticeBean> getNoticeList() {
		return adminDAO.getNoticeList();
	}

	@Override
	public void deleteNotice(int notice_idx) {
		adminDAO.deleteNotice(notice_idx);
	}

	@Override
	public NoticeBean getNotice(int notice_idx) {
		return adminDAO.getNotice(notice_idx);
	}


}
