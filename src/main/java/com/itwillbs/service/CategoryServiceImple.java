package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.CategoryDAO;

@Service
public class CategoryServiceImple implements CategoryService {

	@Inject
	private CategoryDAO categoryDAO;
	
	@Override
	public void addCount(String[] category) {
		categoryDAO.addCount(category);
	}

	@Override
	public void minusCount(String[] preCategory) {
		categoryDAO.minusCount(preCategory);
	}

}
