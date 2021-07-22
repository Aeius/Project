package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.NoticeDAO;
import com.itwillbs.domain.NoticeBean;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Inject
	private NoticeDAO noticeDAO;

	@Override
	public List<NoticeBean> getNoticeList() {
		return noticeDAO.getNoticeList();
	}
}
