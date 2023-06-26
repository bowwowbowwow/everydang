<%@page import="com.everydang.vo.CommentVO"%>
<%@page import="java.util.List"%>
<%@page import="com.everydang.member.service.MemberService"%>
<%@page import="com.everydang.member.service.IMemberService"%>
<%@page import="com.everydang.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>myPageReply</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/myPage/myPageReply.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
</head>
<%@ include file="/header.jsp"%>
<%
	String grade = null;
IMemberService mService = MemberService.getInstance();
MemberVO mvo = mService.selectMemberInfo(memId);
	
	if(mvo.getGr_no().equals("0")){
		grade = "준";
	}else {
		grade = "정";
	}
%>
<div id="wrap">
	<div id="myProfile">
		<div id="profileDetail">
			<img
				src="<%=request.getContextPath()%>/image/user-profile/icon-user-noimage.jpg"
				alt=""> <span id="level"><%= grade %></span> <span
				id="nickName"><%= memId %></span>
		</div>
	</div>
	<div id="container">
		<nav id="menu">
			<h3 class="menuTitle">마이페이지</h3>
			<ul id="mypage">
				<li><a
					href="<%=request.getContextPath()%>/sub/member/myPage/myPageUpdate.jsp">회원정보
						확인/수정</a></li>
			</ul>
			<h3 class="menuTitle">내 활동</h3>
			<ul id="myactivity">
				<li><a
					href="<%=request.getContextPath()%>/myPost.do?id=<%=memId%>">my
						글</a></li>
				<li><a
					href="<%=request.getContextPath()%>/myComment.do?id=<%=memId%>"
					class="active">my 댓글</a></li>
				<li><a
					href="<%=request.getContextPath()%>/myScrap.do?id=<%=memId%>">스크랩</a></li>
			</ul>
			<h3 class="menuTitle">내 쇼핑</h3>
			<ul id="myactivity">
				<li><a
					href="<%=request.getContextPath()%>/sub/member/myPage/myPageOrder.jsp">my
						주문</a></li>
				<li><a
					href="<%=request.getContextPath()%>/sub/member/myPage/myPageReview.jsp">my
						리뷰</a></li>
			</ul>
			<a href="<%=request.getContextPath()%>/sub/faq/faq.jsp"> <i>
					<img
					src="<%=request.getContextPath()%>/image/icon/icon-question.png"
					alt="question"> <span>자주 묻는 질문</span>
			</i>
			</a> <a href="<%=request.getContextPath()%>/logout.do"> <i> <img
					src="<%=request.getContextPath()%>/image/icon/icon-logout.png"
					alt="logout"> <span>로그아웃</span>
			</i>
			</a>
		</nav>


		<div class="postboard">
			<%
	       		List<CommentVO> list = (List<CommentVO>) request.getAttribute("allComments"); 
	        %>
			<p class="postboardtxt">My 댓글</p>
			<br>
			<p class="postboardtxt2">
				총 <span class="spantext"><%=list.size() %></span>개의 댓글을 작성하셨습니다
			</p>
			<%
	            for(int i = 0; i < list.size(); i++) {
	            	CommentVO vo = list.get(i);
	            	%>
	            <div class="post">
					<div class="content">
						<p><%= vo.getCm_content() %></p>
					</div> <br>
					<div class="date">
						<br>
						<%=vo.getCm_date() %>
					</div>
					<div class="contentflex" style="display: flex">
						<div class="frompost" style="margin-bottom: 10px;">
							<p class="ptext">
								<a href="<%=request.getContextPath() %>/postRead.do?board=bowwow&no=<%=vo.getPs_no()%>">
								<span class="spantext">[<%=vo.getBr_name() %>] <%=vo.getPs_subject() %> </span>에 남긴 댓글</a>
							</p>
							
						</div>
						<div class="contentbotton">
						<input type="button" class="delete" value="삭제" id="\${v.cm_no}">
					</div>
					</div>
					
				</div>
			<%
	            }
 	            %>
			
		</div>
	</div>
</div>
</div>
</div>
<footer id="footer"></footer>
<script>
    $(function() {
        // header & footer
        $("#footer").load("<%=request.getContextPath()%>/footer.html");
        
        $(document).on("click", ".delete" ,function() {
        	cm_no = $(this).attr("id");
 			$.ajax({
 				url: "<%=request.getContextPath()%>/myCommentDelete.do",
 				type: 'get',
 				data: { "no": cm_no },
 				success: function(res) {
					console.log(res);
					location.href = "<%=request.getContextPath()%>/sub/member/myPage/myPageReply.jsp";
				},
				error: function(xhr, status) {
					console.log(xhr, status);
				},
				dataType: 'json'
 			});
		});
    </script>
</body>
</html>