package com.everydang.member.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

import com.everydang.member.dao.IMemberDAO;
import com.everydang.member.dao.MemberDAO;
import com.everydang.vo.CommentVO;
import com.everydang.vo.MemberVO;
import com.everydang.vo.MyScrapVO;
import com.everydang.vo.PostVO;
import com.everydang.vo.ReportVO;

public class MemberService implements IMemberService {
	public IMemberDAO dao;
	
	private static MemberService service;
	
	public static MemberService getInstance() {
		if(service == null) service = new MemberService();
		
		return service;
	}
	
	public MemberService() {
		dao = MemberDAO.getInstance();
	}
	
	
	@Override
	public List<PostVO> selectAllPostById(String mmId) {
		return dao.selectAllPostById(mmId);
	}

	@Override
	public PostVO selectProfileById(String mmId) {
		return dao.selectProfileById(mmId);
	}
	
	//회원가입
		@Override
		public int insertJoinInformation(MemberVO membervo) {

			return dao.insertJoinInformation(membervo);
		}

		//아이디 중복
		@Override
		public String selectCheckId(String id) {

			return dao.selectCheckId(id);
		}

		//닉네임 중복
		@Override
		public String selectcheckNickname(String nickname) {

			return dao.selectcheckNickname(nickname);
		}
		
		//로그인
		@Override
		public String selectLogin(String mmId, String mmPassword) {

			return dao.selectLogin(mmId, mmPassword);
		}
		
		//아이디 찾기
		@Override
		public MemberVO selectFindId(Map<String, String> map) {
			
			return dao.selectFindId(map);
		}

		//비밀번호 찾기 - 이메일 라이브러리
		@Override
		public void selectFindPassword(Map<String, String> map) throws EmailException {
			IMemberDAO dao = MemberDAO.getInstance();
			MemberVO member = dao.selectFindPassword(map);
			
			if (member != null) {
				
			String senderId = "choidazzi@naver.com";
		    String senderPw = "rjin@72727";
		    String receiverId = member.getMm_mail();
		    

		     SimpleEmail email = new SimpleEmail();
		      email.setHostName("smtp.naver.com"); 
		      email.setSmtpPort(587); 
		      email.setStartTLSEnabled(true); 
		      
		      email.setAuthenticator(new DefaultAuthenticator(senderId, senderPw)); 
		      email.setFrom(senderId,"EVERY DANG");
		      email.addTo(receiverId, member.getMm_name()); 
		      email.setSubject("[EVERY DANG] 비밀번호 안내"); 
		      email.setMsg("해당 아이디의 비밀번호는 " + member.getMm_password() + " 입니다." ); 
		      email.send();
		      
		      System.out.println(email.getFromAddress());
		      System.out.println(email.getToAddresses());
		      System.out.println(email.getSubject());
		      System.out.println(email.getSmtpPort());
		      System.out.println(email.getSmtpPort());
		      
			} else {
		        // 비밀번호 찾기 실패에 대한 처리
				throw new EmailException("회원 정보가 없습니다.");  // 회원 정보가 없을 경우 예외를 던짐
		    }
		     
			

		}

		//마이페이지
		//my 글
		@Override
		public List<MemberVO> selectMyPost(String mmId) {
			
			return dao.selectMyPost(mmId);
		}
		
		//my 글 삭제
		@Override
		public int deleteMyPost(String ps_no) {
			
			return dao.deleteMyPost(ps_no);
		}
		
		//my 글 삭제
		@Override
		public int deleteLikeOfMyPost(String ps_no) {

			return dao.deleteLikeOfMyPost(ps_no);
		}

		//my 글 삭제
		@Override
		public int deleteScrapOfMyPost(String ps_no) {
			
			return dao.deleteScrapOfMyPost(ps_no);
		}

		//my 글 삭제
		@Override
		public int deleteCommentOfMyPost(String ps_no) {
			
			return dao.deleteCommentOfMyPost(ps_no);
		}

		
		//댓글
		@Override
		public List<CommentVO> selectMyComment(String mm_id) {
			return dao.selectMyComment(mm_id);
		}

		@Override
		public int deleteMyComment(String cm_no) {
			return dao.deleteMyComment(cm_no);
		}

		@Override
		public CommentVO selectMyInfo(String mm_id) {
			return dao.selectMyInfo(mm_id);
		}

		
		// my 스크랩 
		@Override
		public List<MyScrapVO> selectMyScrap(String mm_id) {
			return dao.selectMyScrap(mm_id);
		}
		
		@Override
		public int insertReportMember(ReportVO reportVo) {
			return dao.insertReportMember(reportVo);
		}
		
		@Override
		public int selectMemberPostCount(Map<String, String> parameter) {
			return dao.selectMemberPostCount(parameter);
		}
		
		@Override
		public MemberVO selectMemberInfo(String mm_id) {
			return dao.selectMemberInfo(mm_id);
		}
		
		@Override
		public int updateMemberInfo(MemberVO memberVo) {
			return dao.updateMemberInfo(memberVo);
		}
		
		@Override
		public int deleteMemberInfo(String mm_id) {
			return dao.deleteMemberInfo(mm_id);
		}

		@Override
		public int deleteScrap(String ps_no) {
			// TODO Auto-generated method stub
			return 0;
		}




	}

