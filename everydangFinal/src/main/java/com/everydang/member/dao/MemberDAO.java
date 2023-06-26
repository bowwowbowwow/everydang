package com.everydang.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.everydang.mybatis.config.MyBatisSqlSessionFactory;
import com.everydang.vo.CommentVO;
import com.everydang.vo.MemberVO;
import com.everydang.vo.MyScrapVO;
import com.everydang.vo.PostVO;
import com.everydang.vo.ReportVO;

public class MemberDAO implements IMemberDAO {
	private static IMemberDAO dao;

	public static IMemberDAO getInstance() {
		if (dao == null)
			dao = new MemberDAO();

		return dao;
	}

	@Override
	public List<PostVO> selectAllPostById(String mmId) {
		List<PostVO> postList = null;
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();

		try {
			postList = session.selectList("member.selectAllPostById", mmId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return postList;
	}

	@Override
	public PostVO selectProfileById(String mmId) {
		PostVO memvo = null;
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();

		try {
			memvo = session.selectOne("member.selectProfileById", mmId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return memvo;
	}

	// 회원가입 정보
	@Override
	public int insertJoinInformation(MemberVO membervo) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();

		int cnt = 0;

		try {
			cnt = sqlSession.insert("member.insertJoinInformation", membervo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}

		return cnt;
	}

	// 아이디 중복 검사
	@Override
	public String selectCheckId(String id) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();

		String res = null;

		try {
			res = sqlSession.selectOne("member.selectCheckId", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}

		return res;
	}

	// 닉네임 중복 검사
	@Override
	public String selectcheckNickname(String nickname) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();

		String res = null;

		try {
			res = sqlSession.selectOne("member.selectcheckNickname", nickname);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}

		return res;
	}

	// 로그인, 관리자 로그인
	@Override
	public String selectLogin(String mmId, String mmPassword) {
		String vo = null;
		Map<String, Object> map = new HashMap<>();

		map.put("mm_id", mmId);
		map.put("mm_password", mmPassword);
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		try {
			vo = sqlSession.selectOne("member.selectLogin", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return vo;
	}

	// 아이디 찾기
	@Override
	public MemberVO selectFindId(Map<String, String> map) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();

		MemberVO vo = null;
		try {
			vo = sqlSession.selectOne("member.selectFindId", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return vo;
	}

	// 비밀번호 찾기
	@Override
	public MemberVO selectFindPassword(Map<String, String> map) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();

		MemberVO vo = null;
		try {
			vo = sqlSession.selectOne("member.selectFindPassword", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return vo;
	}

	// my 글
	@Override
	public List<MemberVO> selectMyPost(String mmId) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();

		List<MemberVO> res = null;

		try {
			res = sqlSession.selectList("member.selectMyPost", mmId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}

		return res;
	}

	// my 글 삭제
	@Override
	public int deleteMyPost(String ps_no) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();

		int res = 0;

		try {
			res = sqlSession.delete("member.deleteMyPost", ps_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}

		return res;
	}

	// my 글 삭제
	@Override
	public int deleteLikeOfMyPost(String ps_no) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();

		int res = 0;

		try {
			res = sqlSession.delete("member.deleteLikeOfMyPost", ps_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}

		return res;
	}

	// my 글 삭제
	@Override
	public int deleteScrapOfMyPost(String ps_no) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();

		int res = 0;

		try {
			res = sqlSession.delete("member.deleteScrapOfMyPost", ps_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}

		return res;
	}

	// my 글 삭제
	@Override
	public int deleteCommentOfMyPost(String ps_no) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();

		int res = 0;

		try {
			res = sqlSession.delete("member.deleteCommentOfMyPost", ps_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}

		return res;
	}

	// 댓글
	@Override
	public List<CommentVO> selectMyComment(String mm_id) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		List<CommentVO> list = null;
		try {
			list = session.selectList("member.selectMyComment", mm_id);
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return list;
	}

	@Override
	public int deleteMyComment(String cm_no) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		int count = 0;
		try {
			count = session.delete("deleteMyComment", cm_no);
		} finally {
			session.commit();
			if (session != null) {
				session.close();
			}
		}
		return count;
	}

	@Override
	public CommentVO selectMyInfo(String mm_id) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		CommentVO vo = null;
		try {
			vo = session.selectOne("comment.selectMyInfo", mm_id);
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return vo;
	}

	// my 스크랩
	@Override
	public List<MyScrapVO> selectMyScrap(String mm_id) {
		SqlSession session = null;
		List<MyScrapVO> list = null;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			list = session.selectList("member.selectMyScrap", mm_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return list;

	}

	@Override
	public int insertReportMember(ReportVO reportVo) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		int res = 0;
		try {
			res = session.insert("member.insertReportMember", reportVo);
			System.out.println(res);
		} finally {
			session.commit();
			if (session != null)
				session.close();
		}
		return res;
	}

	@Override
	public int selectMemberPostCount(Map<String, String> parameter) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		int cnt = 0;

		try {
			cnt = session.selectOne("member.selectMemberPostCount", parameter);
		} finally {
			if (session != null)
				session.close();
		}
		return cnt;
	}

	@Override
	public MemberVO selectMemberInfo(String mm_id) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		MemberVO vo = null;

		try {
			vo = session.selectOne("member.selectMemberInfo", mm_id);
		} finally {
			if (session != null)
				session.close();
		}
		return vo;
	}

	@Override
	public int updateMemberInfo(MemberVO memberVo) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		int res = 0;

		try {
			res = session.update("member.updateMemberInfo");
			session.commit();
		} finally {
			if (session != null)
				session.close();
		}
		return res;
	}

	@Override
	public int deleteMemberInfo(String mm_id) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		int res = 0;

		try {
			res = session.delete("member.deleteMemberInfo", mm_id);
			session.commit();
			System.out.println(res);
		} finally {
			if (session != null)
				session.close();
		}
		return res;
	}
	
	// 스크랩 취소
	@Override
	public int deleteScrap(String ps_no) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		
		int res = 0;
		
		try {
			res = sqlSession.delete("member.deleteScrap", ps_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
			}
		
		return res;
	}
}
