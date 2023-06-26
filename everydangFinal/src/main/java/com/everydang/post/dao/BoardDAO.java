package com.everydang.post.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.everydang.mybatis.config.MyBatisSqlSessionFactory;
import com.everydang.vo.BoardVO;

import oracle.net.aso.s;

public class BoardDAO implements IBoardDAO {
	private static IBoardDAO dao;
	
	private BoardDAO() {
	}
	
	public static IBoardDAO getInstance() {
		if (dao == null) {
			dao = new BoardDAO();
		}
		return dao;
	}

	@Override
	public List<BoardVO> selectPostToListBoard() {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		List<BoardVO> list = null; 
		try {
			list = session.selectList("board.selectPostToListBoard");
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return list;
	}

	@Override
	public List<BoardVO> selectAllNotice() {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		List<BoardVO> list = null;
		try {
			list = session.selectList("board.selectAllNotice");
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return list;
	}

	@Override
	public List<BoardVO> selectPostForMain(String br_code) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		List<BoardVO> list = null;
		try {
			list = session.selectList("board.selectPostForMain", br_code);
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return list;
	}

	@Override
	public List<BoardVO> selectPostSortedByLike() {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		List<BoardVO> list = null;
		try {
			list = session.selectList("board.selectPostSortedByLike");
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return list;
	}

	@Override
	public List<BoardVO> selectPostSortedByComment() {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		List<BoardVO> list = null;
		try {
			list = session.selectList("board.selectPostSortedByComment");
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return list;	}
	
	@Override
	public List<BoardVO> selectFindPostToListBoard() {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		List<BoardVO> list = null;
		try {
			list = session.selectList("board.selectFindPostToListBoard");
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return list;
	}


}
