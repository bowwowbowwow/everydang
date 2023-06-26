package com.everydang.admin.service;

import java.util.List;
import java.util.Map;

import com.everydang.vo.AdminVO;
import com.everydang.vo.PageVO;

public interface IAdminService {
	// 총 회원수
	public int selectMemberTotalCount();
	
	// 신규 가입 회원수
	public int selectTodayNewMemberCount();
	
	// 신고 접수 건수
	public int selectTodayNewReportCount();
	
	// 미처리 신고 건수
	public int selectReportCount();
	
	// 최신 게시글
	public List<AdminVO> selectNewPost();
	
	// 인기 게시글
	public List<AdminVO> selectPopularPost();
	
	// 신규 회원
	public List<AdminVO> selectNewMember();
	
	// 전체 회원 목록 (페이징)
	public List<AdminVO> selectAllMember(Map<String, Object> map);
	
	// 멤버 페이지 정보 얻기 
	public PageVO getMemberInfo(int page);
	
	// 전체 신고 목록 (페이징)
	public List<AdminVO> selectAllReport(Map<String, Object> map);
	
	// 신고 페이지 정보 얻기
	public PageVO getReportInfo(int page);
	
	// 총 블랙리스트 수 
	public int selectBlacklistTotalCount();
	
	// 전체 블랙리스트 목록 (페이징)
	public List<AdminVO> selectAllBlacklist(Map<String, Object> map);
	
	// 블랙리스트 페이지 정보 얻기
	public PageVO getBlacklistInfo(int page);
	
	// 신고 철회
	public int deleteReport(String rp_no);
	
	// 블랙리스트 등록
	public int updateBlacklist(String rp_no);
	
	// 강등 처리
	public int updateDefendentGrade(Map<String, String> map);
	
	// 전체 게시글 목록 (페이징)
	public List<AdminVO> selectAllPost(Map<String, Object> map);
	
	// 총 게시글 수
	public int selectPostCount();
	
	// 회원 게시글 관리 페이지 정보 얻기
	public PageVO getPostInfo(int page);
	
	// 게시글 삭제 (1개)
	public int deletePost(String ps_no);
	
	// 게시글 삭제 (여러개)
	public int deletePosts(List<String> list);
	
	// 총 댓글 수
	public int selectCommentCount();
	
	// 전체 댓글 목록 (페이징)
	public List<AdminVO> selectAllComment(Map<String, Object> map);
	
	// 회원 게시글 관리 페이지 정보 얻기
	public PageVO getCommentInfo(int page);
	
	// 댓글 삭제 (1개)
	public int deleteComment(String ps_no);
	
	// (관리자 권한) 블랙리스트 insert
	public int insertBlacklist(String mm_id);
	
	// 총 관리자 게시글 수
	public int selectMyPostCount();
	
	// 총 관리자 댓글 수
	public int selectMyCommentCount();
	
	// 관리자 게시글 목록 (페이징)
	public List<AdminVO> selectAllMyPost(Map<String, Object> map);
	
	// 관리 게시글 관리 페이지 정보 얻기
	public PageVO getMyPostInfo(int page);
	
	// 관리자 댓글 목록 (페이징)
	public List<AdminVO> selectAllMyComment(Map<String, Object> map);
	
	// 관리 댓글 관리 페이지 정보 얻기
	public PageVO getMyCommentInfo(int page);
}
