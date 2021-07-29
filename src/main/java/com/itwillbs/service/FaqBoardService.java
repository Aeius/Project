package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.FaqBoardBean;

public interface FaqBoardService {

	List<FaqBoardBean> getFaqList();

	void insertFaqBoard(FaqBoardBean fbb);

	FaqBoardBean getFaqBoard(int faq_idx);

	void updateFaqBoard(FaqBoardBean fbb);

	void deleteFaqBoard(FaqBoardBean fbb);

	List<FaqBoardBean> getFaqBoardList();
	

}