package com.itwillbs.dao;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.CategoryBean;
import com.itwillbs.domain.ChartBean;
import com.itwillbs.domain.ProductBean;
import com.itwillbs.domain.RecoBean;

@Repository
public class ProductDAOImpl implements ProductDAO {
	// powdery / floral / woody / aqua / fruity / sitrus / spices / modern
	// 마이바티스 객체생성(생성자를 통해서 자동주입)
	@Inject
	private SqlSession sqlSession;
	
	// sql 구문 전체 이름 변수 정의
	private static final String namespace = "com.itwillbs.mapper.ProductMapper";
	
	@Override
	public ArrayList<ProductBean> getProductAllList() {
		return (ArrayList)sqlSession.selectList(namespace+".getProductAllList");
	}
	
	// --------------- 30ml ----------------------------------------
	@Override
	public ArrayList<ProductBean> getProductAllList30() {
		return (ArrayList)sqlSession.selectList(namespace+".getProductAllList30");
	}
	@Override
	public ArrayList<ProductBean> getProductPowderyList() {
		return (ArrayList)sqlSession.selectList(namespace+".getProductPowderyList");
	}
	@Override
	public ArrayList<ProductBean> getProductFloralList() {
		return (ArrayList)sqlSession.selectList(namespace+".getProductFloralList");
	}
	@Override
	public ArrayList<ProductBean> getProductWoodyList() {
		return (ArrayList)sqlSession.selectList(namespace+".getProductWoodyList");
	}
	@Override
	public ArrayList<ProductBean> getProductAquaList() {
		return (ArrayList)sqlSession.selectList(namespace+".getProductAquaList");
	}
	@Override
	public ArrayList<ProductBean> getProductFruityList() {
		return (ArrayList)sqlSession.selectList(namespace+".getProductFruityList");
	}
	@Override
	public ArrayList<ProductBean> getProductSitrusList() {
		return (ArrayList)sqlSession.selectList(namespace+".getProductSitrusList");
	}
	@Override
	public ArrayList<ProductBean> getProductSpicesList() {
		return (ArrayList)sqlSession.selectList(namespace+".getProductSpicesList");
	}
	@Override
	public ArrayList<ProductBean> getProductModernList() {
		return (ArrayList)sqlSession.selectList(namespace+".getProductModernList");
	}
	
	
	// --------------- 50ml ----------------------------------------
	@Override
	public ArrayList<ProductBean> getProductAllList50() {
		return (ArrayList)sqlSession.selectList(namespace+".getProductAllList50");
	}
	@Override
	public ArrayList<ProductBean> getProductPowderyList50() {
		return (ArrayList)sqlSession.selectList(namespace+".getProductPowderyList50");
	}
	@Override
	public ArrayList<ProductBean> getProductFloralList50() {
		return (ArrayList)sqlSession.selectList(namespace+".getProductFloralList50");
	}
	@Override
	public ArrayList<ProductBean> getProductWoodyList50() {
		return (ArrayList)sqlSession.selectList(namespace+".getProductWoodyList50");
	}
	@Override
	public ArrayList<ProductBean> getProductAquaList50() {
		return (ArrayList)sqlSession.selectList(namespace+".getProductAquaList50");
	}
	@Override
	public ArrayList<ProductBean> getProductFruityList50() {
		return (ArrayList)sqlSession.selectList(namespace+".getProductFruityList50");
	}
	@Override
	public ArrayList<ProductBean> getProductSitrusList50() {
		return (ArrayList)sqlSession.selectList(namespace+".getProductSitrusList50");
	}
	@Override
	public ArrayList<ProductBean> getProductSpicesList50() {
		return (ArrayList)sqlSession.selectList(namespace+".getProductSpicesList50");
	}
	@Override
	public ArrayList<ProductBean> getProductModernList50() {
		return (ArrayList)sqlSession.selectList(namespace+".getProductModernList50");
	}
	
	//------------------베스트 상품 리스트----------------------------------------
	@Override
	public ArrayList<ProductBean> getProductBestList() {
		return (ArrayList)sqlSession.selectList(namespace+".getProductBestList");
	}
	// ---------------- 검색 결과 ------------------------------------------------
	@Override
	public ArrayList getProductSearchList(String search) {
		return (ArrayList)sqlSession.selectList(namespace+".getProductSearchList", search);
	}
	
	@Override
	public ProductBean getProductInfo(int product_idx) {
		return sqlSession.selectOne(namespace+".getProductInfo", product_idx);
	}

	@Override
	public void insertProduct(ProductBean productBean) {
		sqlSession.insert(namespace + ".insertProduct", productBean);
	}

	@Override
	public void setStatusRelease(int product_idx) {
		sqlSession.update(namespace + ".setStatusRelease", product_idx);
	}

	@Override
	public void setStatusDiscontinue(int product_idx) {
		sqlSession.update(namespace + ".setStatusDiscontinue", product_idx);
	}

	@Override
	public void updateProduct(ProductBean productBean) {
		sqlSession.update(namespace + ".updateProduct", productBean);
	}

	@Override
	public ArrayList<ProductBean> getBarList() {
		return (ArrayList)sqlSession.selectList(namespace + ".getBarList");
	}

	@Override
	public ArrayList<ChartBean> getLineList() {
		return (ArrayList)sqlSession.selectList(namespace + ".getLineList");
	}

	@Override
	public ArrayList<CategoryBean> getDonutList() {
		return (ArrayList)sqlSession.selectList(namespace + ".getDonutList");
	}

	@Override
	public ArrayList<RecoBean> getRecoList() {
		return (ArrayList)sqlSession.selectList(namespace + ".getRecoList");
	}
	
	
	
	
}
