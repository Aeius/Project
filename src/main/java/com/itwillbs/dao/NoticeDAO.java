package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.FaqBoardBean;
import com.itwillbs.domain.NoticeBean;

public interface NoticeDAO {

	List<NoticeBean> getNoticeList();
}
