package com.everydang.search.dao;

import java.util.List;

import com.everydang.vo.BoardVO;
import com.everydang.vo.PostVO;
import com.everydang.vo.ProductVO;

public interface ISearchPostDAO {
	/**
	 * 검색한 키워드에 일치하는 게시글을 불러오는 메소드
	 * @param keyword 게시글 제목와 일치하는 게시글을 불러오기 위한 키워드
	 * @return 키워드가 있는 게시글들을 저장한 리스트
	 */
	public List<BoardVO> SearchPostList(String keyword);
	
	/**
	 * 검색한 키워드에 일치하는 상품을 불러오는 메소드
	 * @param keyword 상품 이름과 일치하는 게시글을 불러오기 위한 키워드
	 * @return 키워드가 있는 상품들을 저장한 리스트
	 */
	public List<ProductVO> SearchProdList(String keyword);
}
