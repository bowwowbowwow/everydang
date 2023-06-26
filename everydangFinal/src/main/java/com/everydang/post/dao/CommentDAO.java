package com.everydang.post.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.everydang.mybatis.config.MyBatisSqlSessionFactory;
import com.everydang.vo.CommentVO;

public class CommentDAO implements ICommentDAO {
	private static ICommentDAO dao;
	
	private CommentDAO() {
		
	}
	
	public static ICommentDAO getInstance() {
		if (dao == null) {
			dao = new CommentDAO();
		}
		return dao;
	}

	@Override
	public List<CommentVO> selectAllCommentsPerPost(int ps_no) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		List<CommentVO> list = null;
		try {
			list = session.selectList("comment.selectAllCommentsPerPost", ps_no);
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return list;
	}

	@Override
	public int insertNewComment(CommentVO vo) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		int count = 0;
		try {
			count = session.insert("comment.insertNewComment", vo);
		} finally {
			session.commit();
			if (session!= null) {
				session.close();
			}
		}
		return count;
	}

	@Override
	public List<CommentVO> selectAllReply(String cm_reno) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		List<CommentVO> vo = null;
		try {
			vo = session.selectList("comment.selectAllReply", cm_reno);
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return vo;
	}

	@Override
	public CommentVO selectCommentPerPost(int ps_no) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		CommentVO vo = null; 
		try {
			vo = session.selectOne("comment.selectCommentPerPost", ps_no);
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return vo;
	}

	@Override
	public int deleteComment(String cm_no) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		int count = 0;
		try {
			count = session.delete("comment.deleteComment", cm_no);
		} finally {
			session.commit();
			if(session != null) {
				session.close();
			}
		}
		return count;
	}
}
