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

	@Override
	public void insertfaqBoard(FaqBoardBean fbb) {
		System.out.println("FaqBoardServiceImpl - insertfaqBoard()");
		// 처리작업 name, pass,subject,content 폼에서 들고옴
		//  num date 처리작업
				
		fbb.setFaq_date(new Timestamp(System.currentTimeMillis())); 
				
		//메서드 호출
		faqBoardDAO.insertfaqBoard(fbb);
	}
	
}