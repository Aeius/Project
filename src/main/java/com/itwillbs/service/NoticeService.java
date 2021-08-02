package com.itwillbs.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.itwillbs.domain.EmailDTO;
import com.itwillbs.domain.MemberBean;
import com.itwillbs.domain.NoticeBean;
import com.itwillbs.domain.PageBean;

public interface NoticeService {

	List<NoticeBean> getNoticeList();

	NoticeBean getNoticeDatail(int notice_idx);

	List<NoticeBean> getNoticeList(PageBean pb);

	Integer getnoticeCount();
////=====================작업중	
//

	

	int sendQnaMail(MemberBean memberBean, EmailDTO dto);

	
//	public void sendQnaMail(MemberBean memberBean,HttpServletRequest request);

}
