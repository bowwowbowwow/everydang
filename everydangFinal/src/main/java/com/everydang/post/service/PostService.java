package com.everydang.post.service;

import java.util.HashMap;
import java.util.Map;

import com.everydang.post.dao.IPostDAO;
import com.everydang.post.dao.PostDAO;
import com.everydang.vo.PostVO;

public class PostService implements IPostService {
	private static IPostService service;
	private IPostDAO dao;
	
	private PostService() {
		dao = PostDAO.getInstance();
	}
	
	public static IPostService getInstance() {
		if (service == null) {
			service = new PostService();
		}
		return service;
	}

	@Override
	public PostVO selectPost(int ps_no) {
		return dao.selectPost(ps_no);
	}

	@Override
	public int insertNotice(PostVO vo) {
		return dao.insertNotice(vo);
	}

	@Override
	public int insertPost(PostVO vo) {
		return dao.insertPost(vo);
	}

	@Override
	public int updateHit(int ps_no) {
		return dao.updateHit(ps_no);
	}

	@Override
	public int insertLikeInfo(PostVO vo) {
		return dao.insertLikeInfo(vo);
	}

	@Override
	public int deleteLikeInfo(PostVO vo) {
		return dao.deleteLikeInfo(vo);
	}

	@Override
	public int insertScrapInfo(PostVO vo) {
		return dao.insertScrapInfo(vo);
	}

	@Override
	public int deleteScrapInfo(PostVO vo) {
		return dao.deleteScrapInfo(vo);
	}

	@Override
	public int selectHit(int ps_no) {
		return dao.selectHit(ps_no);
	}

	@Override
	public PostVO selectPostInfo(int ps_no) {
		return dao.selectPostInfo(ps_no);
	}

	@Override
	public int updatePostInfo(PostVO vo) {
		return dao.updatePostInfo(vo);
	}

	@Override
	public int deletePost(PostVO vo) {
		return dao.deletePost(vo);
	}
	
	@Override
	public PostVO selectMemberInfo(String mm_id) {
		return dao.selectMemberInfo(mm_id);
	}

	@Override
	public int selectLikeOn(Map<String, Object> map) {
		return dao.selectLikeOn(map);
	}

	@Override
	public int selectScrapOn(Map<String, Object> map) {
		return dao.selectScrapOn(map);
	}

}
