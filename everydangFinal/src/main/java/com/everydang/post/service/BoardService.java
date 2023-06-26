package com.everydang.post.service;

import java.util.List;
import java.util.Map;

import javax.naming.spi.DirStateFactory.Result;

import com.everydang.post.dao.BoardDAO;
import com.everydang.post.dao.IBoardDAO;
import com.everydang.vo.BoardVO;

public class BoardService implements IBoardService {
	private static IBoardService service;
	private IBoardDAO dao;

	private BoardService() {
		dao = BoardDAO.getInstance();
	}

	public static IBoardService getInstance() {
		if (service == null) {
			service = new BoardService();
		}
		return service;
	}

	@Override
	public List<BoardVO> selectPostToListBoard() {
		return dao.selectPostToListBoard();
	}

	@Override
	public List<BoardVO> selectAllNotice() {
		return dao.selectAllNotice();
	}

	@Override
	public List<BoardVO> selectPostForMain(String br_code) {
		return dao.selectPostForMain(br_code);
	}

	@Override
	public List<BoardVO> selectPostSortedByLike() {
		return dao.selectPostSortedByLike();
	}

	@Override
	public List<BoardVO> selectPostSortedByComment() {
		return dao.selectPostSortedByComment();
	}

	@Override
	public List<BoardVO> selectFindPostToListBoard() {
		return dao.selectFindPostToListBoard();
	}

}
