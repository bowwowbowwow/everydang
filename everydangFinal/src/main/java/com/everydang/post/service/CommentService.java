package com.everydang.post.service;

import java.util.List;

import com.everydang.post.dao.CommentDAO;
import com.everydang.post.dao.ICommentDAO;
import com.everydang.vo.CommentVO;

public class CommentService implements ICommentService {
	private static ICommentService service;
	private ICommentDAO dao;

	private CommentService() {
		dao = CommentDAO.getInstance();
	}

	public static ICommentService getInstance() {
		if (service == null) {
			service = new CommentService();
		}
		return service;
	}

	@Override
	public List<CommentVO> selectAllCommentsPerPost(int ps_no) {
		return dao.selectAllCommentsPerPost(ps_no);
	}

	@Override
	public int insertNewComment(CommentVO vo) {
		return dao.insertNewComment(vo);
	}

	@Override
	public List<CommentVO> selectAllReply(String cm_reno) {
		return dao.selectAllReply(cm_reno);
	}

	@Override
	public CommentVO selectCommentPerPost(int ps_no) {
		return dao.selectCommentPerPost(ps_no);
	}

	@Override
	public int deleteComment(String cm_no) {
		return dao.deleteComment(cm_no);
	}

}
