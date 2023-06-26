package com.everydang.post.service;

import java.util.Map;

import com.everydang.vo.PostVO;

public interface IPostService {
	/**
	 * 특정 글번호를 가지는 글의 정보를 반환하는 메서드
	 * 
	 * @param ps_no 글번호
	 * @return 특정 글번호에 해당하는 글의 정보
	 */
	public PostVO selectPost(int ps_no);
	
	/**
	 * 작성한 공지사항을 데이터베이스에 저장하는 메서드
	 * @param vo 작성한 공지사항에 대한 정보
	 * @return 작업 성공: 1, 작업 실패: 0
	 */
	public int insertNotice(PostVO vo);
	
	/**
	 * 작성한 글을 데이터베이스에 저장하는 메서드
	 * @param vo 작성한 글에 대한 정보
	 * @return 작업 성공: 1, 작업 실패: 0
	 */
	public int insertPost(PostVO vo);
	
	/**
	 * 특정 글의 조회수를 1씩 추가하는 메서드
	 * @param ps_no 조회수를 증가할 글의 번호
	 * @return 작업 성공: 1, 작업 실패: 0
	 */
	public int updateHit(int ps_no);
	
	/**
	 * 특정 글의 조회수를 읽어오는 메서드
	 * @param ps_no 글 번호
	 * @return 조회수
	 */
	public int selectHit(int ps_no);
	
	/**
	 * 좋아요를 클릭한 글과 클릭한 회원의 정보를 데이터베이스에 저장하는 메서드
	 * @param vo 해당 글과 회원의 정보
	 * @return 작업 성공: 1, 작업 실패: 0
	 */
	public int insertLikeInfo(PostVO vo);
	
	/**
	 * 좋아요를 클릭한 글과 클릭한 회원의 정보를 데이터베이스에 삭제하는 메서드
	 * @param vo 해당 글과 회원의 정보
	 * @return 작업 성공: 1, 작업 실패: 0
	 */
	public int deleteLikeInfo(PostVO vo);
	
	/**
	 * 스크랩한 글과 클릭한 회원의 정보를 데이터베이스에 저장하는 메서드
	 * @param vo 해당 글과 회원의 정보
	 * @return 작업 성공: 1, 작업 실패: 0
	 */
	public int insertScrapInfo(PostVO vo);
	
	/**
	 * 스크랩한 글과 클릭한 회원의 정보를 데이터베이스에 삭제하는 메서드
	 * @param vo 해당 글과 회원의 정보
	 * @return 작업 성공: 1, 작업 실패: 0
	 */
	public int deleteScrapInfo(PostVO vo);
	
	/**
	 * 특정 글의 정보를 불러오는 메서드
	 * @param ps_no 수정할 글 번호
	 * @return 수정할 글의 정보
	 */
	public PostVO selectPostInfo(int ps_no);
	
	/**
	 * 특정 글을 수정하는 메서드
	 * @param vo 수정할 글의 정보
	 * @return 작업 성공: 1, 작업 성공: 0
	 */
	public int updatePostInfo(PostVO vo);
	
	/**
	 * 특정 회원이 작성한 글을 삭제하는 메서드
	 * @param vo 삭제할 글의 정보
	 * @return 작업 성공: 1, 작업 실패: 0
	 */
	public int deletePost(PostVO vo);
	
	public PostVO selectMemberInfo(String mm_id);
	
	public int selectLikeOn(Map<String, Object> map);

	public int selectScrapOn(Map<String, Object> map);

}
