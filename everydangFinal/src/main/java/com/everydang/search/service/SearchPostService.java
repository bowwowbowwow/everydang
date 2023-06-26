package com.everydang.search.service;

import java.util.List;

import com.everydang.search.dao.ISearchPostDAO;
import com.everydang.search.dao.SearchPostDAO;
import com.everydang.vo.BoardVO;
import com.everydang.vo.PostVO;
import com.everydang.vo.ProductVO;

public class SearchPostService implements ISearchPostService {
	ISearchPostDAO dao;
	private static ISearchPostService service;
	private SearchPostService() {
		dao = SearchPostDAO.getInstance();
	}
	public static ISearchPostService getInstance() {
		if(service == null) service = new SearchPostService();
		return service;
	}
	
	@Override
	public List<BoardVO> SearchPostList(String keyword) {
		return dao.SearchPostList(keyword);
	}
	
	@Override
	public List<ProductVO> SearchProdList(String keyword) {
		return dao.SearchProdList(keyword);
	}

}
