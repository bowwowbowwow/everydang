package com.everydang.post.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.everydang.mybatis.config.MyBatisSqlSessionFactory;
import com.everydang.vo.PostVO;

import oracle.net.aso.s;

public class PostDAO implements IPostDAO {
	private static IPostDAO dao;

	private PostDAO() {

	}

	public static IPostDAO getInstance() {
		if (dao == null) {
			dao = new PostDAO();
		}
		return dao;
	}

	@Override
	public PostVO selectPost(int ps_no) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		PostVO vo = null;
		try {
			vo = session.selectOne("post.selectPost", ps_no);
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return vo;
	}

	@Override
	public int insertNotice(PostVO vo) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		int count = 0;
		try {
			count = session.insert("post.insetNotice", vo);
		} finally {
			session.commit();
			if (session != null) {
				session.close();
			}
		}
		return count;
	}

	@Override
	public int insertPost(PostVO vo) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		int count = 0;
		try {
			count = session.insert("post.insertPost", vo);
		} finally {
			session.commit();
			if (session != null) {
				session.close();
			}
		}
		return count;
	}

	@Override
	public int updateHit(int ps_no) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		int count = 0;
		try {
			count = session.update("post.updateHit", ps_no);
		} finally {
			session.commit();
			if (session != null) {
				session.close();
			}
		}
		return count;
	}

	@Override
	public int insertLikeInfo(PostVO vo) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		int count = 0;
		try {
			count = session.insert("post.insertLikeInfo", vo);
		} finally {
			session.commit();
			if (session != null) {
				session.close();
			}
		}
		return count;
	}

	@Override
	public int deleteLikeInfo(PostVO vo) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		int count = 0;
		try {
			count = session.delete("post.deleteLikeInfo", vo);
		} finally {
			session.commit();
			if (session != null) {
				session.close();
			}
		}
		return count;
	}

	@Override
	public int insertScrapInfo(PostVO vo) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		int count = 0;
		try {
			count = session.insert("post.insertScrapInfo", vo);
		} finally {
			session.commit();
			if (session != null) {
				session.close();
			}
		}
		return count;
	}

	@Override
	public int deleteScrapInfo(PostVO vo) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		int count = 0;
		try {
			count = session.delete("post.deleteScrapInfo", vo);
		} finally {
			session.commit();
			if (session != null) {
				session.close();
			}
		}
		return count;
	}

	@Override
	public int selectHit(int ps_no) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		int count = 0;
		try {
			count = session.selectOne("post.selectHit", ps_no);
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return count;
	}

	@Override
	public PostVO selectPostInfo(int ps_no) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		PostVO vo = null;
		try {
			vo = session.selectOne("post.selectPostInfo", ps_no);
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return vo;
	}

	@Override
	public int updatePostInfo(PostVO vo) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		int count = 0;
		try {
			count = session.update("post.updatePostInfo", vo);
		} finally {
			session.commit();
			if (session != null) {
				session.close();
			}
		}
		return count;
	}

	@Override
	public int deletePost(PostVO vo) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		int count = 0;
		try {
			count = session.delete("post.deletePost", vo);
		} finally {
			session.commit();
			if (session != null) {
				session.close();
			}
		}
		return count;
	}

	@Override
	public PostVO selectMemberInfo(String mm_id) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		PostVO selectOneMember = null;
		try {
			if (selectOneMember == null) {
				selectOneMember = new PostVO();
				selectOneMember.setMm_id("guest");
				selectOneMember.setMm_nickname("guest");
			}
			selectOneMember = session.selectOne("post.selectMemberInfo", mm_id);
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return selectOneMember;
	}

	@Override
	public int selectLikeOn(Map<String, Object> map) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		int count = 0;
		try {
			if (session.selectOne("post.selectLikeOn", map) == null) {
				return 0;
			} else {
				count = session.selectOne("post.selectLikeOn", map);
			}
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return count;
	}

	@Override
	public int selectScrapOn(Map<String, Object> map) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		int count = 0;
		try {
			if (session.selectOne("post.selectScrapOn", map) == null) {
				return 0;
			} else {
				count = session.selectOne("post.selectScrapOn", map);
			}
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return count;
	}

}
