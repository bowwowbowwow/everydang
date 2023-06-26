package com.everydang.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.everydang.mybatis.config.MyBatisSqlSessionFactory;
import com.everydang.vo.AdminVO;
import com.everydang.vo.PageVO;

public class AdminDAO implements IAdminDAO{
	private static IAdminDAO dao;
	
	public static IAdminDAO getInstance() {
		if(dao == null)dao = new AdminDAO();
		return dao;
	}

	@Override
	public int selectMemberTotalCount() {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			cnt = session.selectOne("admin.selectMemberTotalCount");
			System.out.println(cnt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null)
			session.close();
		}
		return cnt;
	}

	@Override
	public int selectTodayNewMemberCount() {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			cnt = session.selectOne("admin.selectTodayNewMemberCount");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public int selectTodayNewReportCount() {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			cnt = session.selectOne("admin.selectTodayNewReportCount");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public List<AdminVO> selectNewPost() {
		SqlSession session = null;
		List<AdminVO> list = null;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			list = session.selectList("admin.selectNewPost");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<AdminVO> selectPopularPost() {
		SqlSession session = null;
		List<AdminVO> list = null;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			list = session.selectList("admin.selectPopularPost");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<AdminVO> selectNewMember() {
		SqlSession session = null;
		List<AdminVO> list = null;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			list = session.selectList("admin.selectNewMember");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<AdminVO> selectAllMember(Map<String, Object> map) {
		SqlSession session = null;
		List<AdminVO> list = null;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			list = session.selectList("admin.selectAllMemberPerPage", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<AdminVO> selectAllReport(Map<String, Object> map) {
		SqlSession session = null;
		List<AdminVO> list = null;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			list = session.selectList("admin.selectAllReport", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int selectBlacklistTotalCount() {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			cnt = session.selectOne("admin.selectBlacklistTotalCount");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public List<AdminVO> selectAllBlacklist(Map<String, Object> map) {
		SqlSession session = null;
		List<AdminVO> list = null;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			list = session.selectList("admin.selectAllBlacklist", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int deleteReport(String rp_no) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			res = session.delete("admin.deleteReport",rp_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int updateBlacklist(String rp_no) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			res = session.update("admin.updateBlacklist",rp_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int updateDefendentGrade(Map<String, String> map) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			res = session.update("admin.updateDefendentGrade",map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int selectReportCount() {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			cnt = session.selectOne("admin.selectReportCount");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public List<AdminVO> selectAllPost(Map<String, Object> map) {
		SqlSession session = null;
		List<AdminVO> list = null;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			list = session.selectList("admin.selectAllPost", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int selectPostCount() {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			cnt = session.selectOne("admin.selectPostCount");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public int deletePost(String ps_no) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			cnt = session.delete("admin.deletePost", ps_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int deletePosts(List<String> list) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			cnt = session.delete("admin.deletePosts", list);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int selectCommentCount() {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			cnt = session.selectOne("admin.selectCommentCount");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public List<AdminVO> selectAllComment(Map<String, Object> map) {
		SqlSession session = null;
		List<AdminVO> list = null;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			list = session.selectList("admin.selectAllComment", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int deleteComment(String cm_no) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			cnt = session.delete("admin.deleteComment", cm_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int insertBlacklist(String mm_id) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			cnt = session.insert("admin.insertBlacklist", mm_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int selectMyPostCount() {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			cnt = session.selectOne("admin.selectMyPostCount");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public int selectMyCommentCount() {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			cnt = session.selectOne("admin.selectMyCommentCount");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public List<AdminVO> selectAllMyPost(Map<String, Object> map) {
		SqlSession session = null;
		List<AdminVO> list = null;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			list = session.selectList("admin.selectAllMyPost", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<AdminVO> selectAllMyComment(Map<String, Object> map) {
		SqlSession session = null;
		List<AdminVO> list = null;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			list = session.selectList("admin.selectAllMyComment", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}


}
