package com.everydang.post.service;

import java.util.List;

import com.everydang.vo.CommentVO;

public interface ICommentService {
	public List<CommentVO> selectAllCommentsPerPost(int ps_no);
	
	public int insertNewComment(CommentVO vo);
	
	public List<CommentVO> selectAllReply(String cm_reno);

	public CommentVO selectCommentPerPost(int ps_no);
	
	public int deleteComment(String cm_no);
}
