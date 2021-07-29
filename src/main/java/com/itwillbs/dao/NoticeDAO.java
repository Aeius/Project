package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.FaqBoardBean;
import com.itwillbs.domain.NoticeBean;
import com.itwillbs.domain.PageBean;

public interface NoticeDAO {

	List<NoticeBean> getNoticeList();

	NoticeBean getNoticeDetail(int notice_idx);
	//==================== 작업중(notice list)
	List<NoticeBean> getNoticeList(PageBean pb);

	Integer getNoticeCount();


}