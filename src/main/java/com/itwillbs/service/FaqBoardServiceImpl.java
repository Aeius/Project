package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.FaqBoardDAO;
import com.itwillbs.domain.FaqBoardBean;

@Service
public class FaqBoardServiceImpl implements FaqBoardService {
	
	@Inject
	private FaqBoardDAO faqBoardDAO;

	@Override
	public List<FaqBoardBean> getFaqList() {

		return faqBoardDAO.getFaqList();
	}
	
}
