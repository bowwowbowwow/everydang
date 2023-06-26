<%@page import="com.everydang.vo.MyScrapVO"%>
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
<title>myPageScrape</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/myPage/myPageScrape.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
</head>

<%@ include file="/header.jsp"%>
<%
String grade = null;
IMemberService mService = MemberService.getInstance();
MemberVO mvo = mService.selectMemberInfo(memId);

if (mvo.getGr_no().equals("0")) {
	grade = "준";
} else {
	grade = "정";
}
%>
<div id="wrap">
	<div id="myProfile">
		<div id="profileDetail">
			<img
				src="<%=request.getContextPath()%>/image/user-profile/icon-user-noimage.jpg"
				alt=""> <span id="level"><%=grade%></span> <span
				id="nickName"><%=memId%></span>
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
					href="<%=request.getContextPath()%>/myComment.do?id=<%=memId%>">my
						댓글</a></li>
				<li><a
					href="<%=request.getContextPath()%>/myScrap.do?id=<%=memId%>"
					class="active">스크랩</a></li>
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
			List<MyScrapVO> list = (List<MyScrapVO>) request.getAttribute("myScrapList");
			%>
			<p class="postboardtxt">My 스크랩</p>
			<br>
			<p class="postboardtxt2">
				총 <span class="spantext"><%=list.size()%></span>개의 글을 스크랩하셨습니다.
			</p>
			<%
			for (int i = 0; i < list.size(); i++) {
				MyScrapVO vo = list.get(i);
			%>
			<div class="post">
				<div class="title">
					<span><%=vo.getPs_subject()%></span>
				</div>
				<br>

				<div class="date">
					<span><%=vo.getPs_date()%></span>
				</div>
				<br>
				<br>

				<div class="content">
					<div class="contentbotton">
						<input type="button" class="modify" value="수정"> <input
							type="button" id="<%=vo.getPs_no()%> class=" delete" value="삭제">
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
	</div>

</div>
<footer id="footer"></footer>
<script>
        // header & footer
        $("#footer").load("<%=request.getContextPath()%>/footer.jsp");
        
        //삭제
        $(document).on('click', '.delete', function() {
	     	if(confirm("게시글을 삭제하시겠습니까?")) {
	     		
	     		vpsno = $(this).attr("id");
	    		
	    		$.ajax({
	    			url: "<%=request.getContextPath()%>/scrapDelete.do",
	    			type: 'get',
	    			data: {"ps_no" : vpsno},
	    			success: function(res) {
	    				alert("게시글이 성공적으로 삭제되었습니다.");
	    				location.href = "<%=request.getContextPath()%>/sub/member/myPage/myPageScrape.jsp";
										},
										error : function(xhr) {
											alert("오류: " + xhr.status);
										},
										dataType : 'json'
									});
						} else {
							return false;
						}
					});
</script>
</body>

</html>