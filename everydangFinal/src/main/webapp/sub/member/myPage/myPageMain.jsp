<%@page import="com.everydang.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>myPageMain</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/myPage/myPageMain.css">
    <script src="<%= request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
</head>
<body>
<%
	int[] cnts =(int[]) request.getAttribute("counts");
	String grade = null;
	int adminNo = (Integer) session.getAttribute("adminNo");
	MemberVO vo = (MemberVO) request.getAttribute("selectMemberInfo");
	
	if(vo.getGr_no().equals("0")){
		grade = "준";
	}else {
		grade = "정";
	}
	
%>
<%@ include file="/header.jsp" %>
    <div id="wrap">
        <div id="myProfile">
            <div id="profileDetail">
            <%
            if(vo.getMm_profile() == null || vo.getMm_profile().equals("filepath")) {
            	%>
                <img src="<%=request.getContextPath()%>/image/user-profile/icon-user-noimage.jpg" alt="icon-user-noimage.jpg">
            	<%
            } else {
            	%>
                <img src="<%=request.getContextPath()%>/images/<%=vo.getMm_profile() %>" alt="<%=vo.getMm_profile() %>">
            	<%
            }
            %> 
                <span id="level"><%=grade %></span>
                <span id="nickName"><%=vo.getMm_nickname() %></span>
            </div>
        </div>
        <div id="container">
            <nav id="menu">
                <h3 class="menuTitle">마이페이지</h3>
                <ul id="mypage">
                    <li><a href="<%= request.getContextPath() %>/updateMemberInfoChkpass.do?Id=<%=vo.getMm_id()%>">회원정보 확인/수정</a></li>
                    
                </ul>
                <h3 class="menuTitle">내 활동</h3>
                <ul id="myactivity">
                    <li><a href="<%=request.getContextPath()%>/myPost.do?id=<%=memId%>">my 글</a></li>
                    <li><a href="<%=request.getContextPath()%>/myComment.do?id=<%=memId%>">my 댓글</a></li>
                    <li><a href="<%=request.getContextPath()%>/myScrap.do?id=<%=memId%>">스크랩</a></li>
                </ul>
                <h3 class="menuTitle">내 쇼핑</h3>
                <ul id="myactivity">
                    <li><a href="<%=request.getContextPath()%>/sub/member/myPage/myPageOrder.jsp">my 주문</a></li>
                    <li><a href="<%=request.getContextPath()%>/sub/member/myPage/myPageReview.jsp">my 리뷰</a></li>
                </ul>
                <a href="#">
                    <i>
                        <img src="<%= request.getContextPath() %>/image/icon/icon-question.png" alt="question"> <span>자주 묻는 질문</span>
                    </i>
                </a>
                <a href="<%=request.getContextPath()%>/logout.do">
                    <i>
                        <img src="<%=request.getContextPath()%>/image/icon/icon-logout.png" alt="logout"> <span>로그아웃</span>
                    </i>
                </a>
            </nav>
            <div id="myActivities">
                <h2 id="activityTitle">내 활동</h2>
                <div id="activities">
                    <div id="write" class="a">
                        <img src="<%= request.getContextPath() %>/image/icon/icon-document.png" alt="document">
                        <span>내가 쓴 글</span>
                        <div class="select">
                            <a href="<%= request.getContextPath() %>/myPagePost.do?Id=<%=memId%>"><%= cnts[0]  %></a>
                            <span>개</span>
                        </div>
                    </div>
                    <div id="comment" class="a">
                        <img src="<%= request.getContextPath() %>/image/icon/icon-comment.png" alt="comment">
                        <span>내가 쓴 댓글</span>
                        <div class="select">
                            <a href="<%= request.getContextPath() %>/myComment.do?Id=<%=memId%>"><%= cnts[1]  %></a>
                            <span>개</span>
                        </div>
                    </div>
                    <div id="scrap" class="a">
                        <img src="<%= request.getContextPath() %>/image/icon/icon-collect.png" alt="scrap">
                        <span>스크랩</span>
                        <div class="select">
                            <a href="<%= request.getContextPath() %>/myScrap.do?Id=<%=memId%>"><%= cnts[2]  %></a>
                            <span>개</span>
                        </div>
                    </div>
                </div>
                <div id="banner">
                    <a href="#">
                        <img src="<%= request.getContextPath() %>/image/sub/mypage/banner.png" alt="banner">
                    </a>
                </div>
            </div>
        </div>
    </div>
    <footer id="footer"></footer>
    <script>
        // header & footer
        $("#footer").load("<%= request.getContextPath() %>/footer.jsp");
        
    </script>
</body>
</html>