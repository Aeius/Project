package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.CategoryDAO;

@Service
public class CategoryServiceImple implements CategoryService {

	@Inject
	private CategoryDAO categoryDAO;
	
	@Override
	public void addManCount(String recoCategory) {
		categoryDAO.addManCount(recoCategory);
	}

	@Override
	public void addWomanCount(String recoCategory) {
		categoryDAO.addWomanCount(recoCategory);
	}

	@Override
	public void addNonCount(String recoCategory) {
		categoryDAO.addNonCount(recoCategory);
	}

}
