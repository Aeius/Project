package com.itwillbs.service;

import java.sql.Timestamp;
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

	
	//관리자 페이지에서 FAQ 쓰기
	@Override
	public void insertFaqBoard(FaqBoardBean fbb) {
		System.out.println("FaqBoardServiceImpl - insertFaqBoard()");
		// date 처리작업
		fbb.setFaq_date(new Timestamp(System.currentTimeMillis()));
				
		//메서드 호출
		faqBoardDAO.insertFaqBoard(fbb);
	}


	@Override
	public FaqBoardBean getFaqBoard(int faq_idx) {
		return faqBoardDAO.getFaqBoard(faq_idx);
	}


	@Override
	public void updateFaqBoard(FaqBoardBean fbb) {
		// date 처리작업
		fbb.setFaq_date(new Timestamp(System.currentTimeMillis()));
		faqBoardDAO.updateFaqBoard(fbb);
	}


	@Override
	public void deleteFaqBoard(FaqBoardBean fbb) {
		faqBoardDAO.deleteFaqBoard(fbb);
	}


	@Override
	public List<FaqBoardBean> getFaqBoardList() {
		return faqBoardDAO.getFaqBoardList();
	}
	
}