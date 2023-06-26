package com.everydang.post.service;

import java.util.List;
import java.util.Map;

import com.everydang.vo.BoardVO;

public interface IBoardService {
	/**
	 * 멍멍게시판의 모든 글을 최신순으로 반환하는 메서드
	 * 
	 * @return 최신순으로 정렬된 멍멍게시판의 모든 글
	 */
	public List<BoardVO> selectPostToListBoard();

	/**
	 * 공지사항 게시판의 글을 가져와 리스트로 반환하는 메서드
	 * 
	 * @return 공지사항 게시판의 모든 글
	 */
	public List<BoardVO> selectAllNotice();

	/**
	 * 멍멍게시판, 공지사항의 글을 리스트로 반환하는 메서드
	 * 
	 * @param br_code 게시판별로 글을 가져오기 위해 게시판 코드를 매개변수로 받음
	 * @return 각 게시판별로 가져온 글들이 저장되는 리스트
	 */
	public List<BoardVO> selectPostForMain(String br_code);

	/**
	 * 멍멍게시판의 글을 좋아요순으로 반환하는 메서드
	 * 
	 * @return 좋아요순으로 정렬된 멍멍게시판의 모든 글
	 */
	public List<BoardVO> selectPostSortedByLike();
	
	/**
	 * 멍멍게시판의 글을 댓글순으로 반환하는 메서드
	 * 
	 * @return 댓글순으로 정렬된 멍멍게시판의 모든 글
	 */
	public List<BoardVO> selectPostSortedByComment();
	
	public List<BoardVO> selectFindPostToListBoard();

}
