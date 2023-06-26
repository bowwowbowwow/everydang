package com.everydang.member.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.mail.EmailException;

import com.everydang.vo.CommentVO;
import com.everydang.vo.MemberVO;
import com.everydang.vo.MyScrapVO;
import com.everydang.vo.PostVO;
import com.everydang.vo.ReportVO;

public interface IMemberService {
	public List<PostVO> selectAllPostById(String mmId);

	public PostVO selectProfileById(String mmId);

	// 회원 정보
	public int insertJoinInformation(MemberVO membervo);

	// 아이디 중복
	public String selectCheckId(String id);

	// 닉네임 중복
	public String selectcheckNickname(String nickname);

	// 로그인, 관리자 로그인
	public String selectLogin(String mmId, String mmPassword);

	// 아이디 찾기
	public MemberVO selectFindId(Map<String, String> map);

	// 비밀번호 찾기
	public void selectFindPassword(Map<String, String> map) throws EmailException;

	// 마이페이지
	// my 글
	public List<MemberVO> selectMyPost(String mmId);

	// my 글 삭제
	public int deleteMyPost(String ps_no);

	public int deleteLikeOfMyPost(String ps_no);

	public int deleteScrapOfMyPost(String ps_no);

	public int deleteCommentOfMyPost(String ps_no);

	// 댓글
	public List<CommentVO> selectMyComment(String mm_id);

	public CommentVO selectMyInfo(String mm_id);

	public int deleteMyComment(String cm_no);

	// my 스크랩
	public List<MyScrapVO> selectMyScrap(String mm_id);
	
	/**
	 * 다른 유저가 해당 유저를 신고하는 메소드
	 * @param reportVo 해당 유저를 신고하는 정보가 담긴 reportVo
	 * @return 성공 시 1, 실패 시 0
	 */
	
	public int insertReportMember(ReportVO reportVo);
	
	/**
	 * 마이페이저에 포스트, 댓글, 스크랩 수의 총 갯수를 가져오는 메소드
	 * @param parameter 테이블네임,
	 * @return
	 */
	
	public int selectMemberPostCount(Map<String, String> parameter);
	
	/**
	 * 마이페이지의 회원정보를 모두 불러오는 메소드
	 * @param mm_id 해당 정보를 불러오는 매개변수
	 * @return mm_id의 정보가 들어있는 memberVO
	 */
	public MemberVO selectMemberInfo(String mm_id);
	
	/**
	 * 수정된 회원정보를 업데이트하는 메소드
	 * @param memberVo 수정된 정보가 들어있는 vo
	 * @return 성공 시 1, 실패 시 0
	 */
	public int updateMemberInfo(MemberVO memberVo);
	
	/**
	 * 존재하는 회원정보의 모든 데이터를 삭제하는 메소드
	 * @param mm_id 해당 정보를 확인하는 매개변수
	 * @return 성공 시 삭제된 row수, 실패 시 0
	 */
	public int deleteMemberInfo(String mm_id);
	
	// 스크랩 취소
		public int deleteScrap(String ps_no);
	
	
}
