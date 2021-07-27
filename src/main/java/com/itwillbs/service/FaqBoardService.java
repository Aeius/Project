package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.FaqBoardBean;

public interface FaqBoardService {

	List<FaqBoardBean> getFaqList();

	void insertfaqBoard(FaqBoardBean fbb);

}