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
    <title>myPageUpdate</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/myPage/myPageUpdate.css">
    <script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
</head>
<body>

<%@ include file="/header.jsp" %>
<%
	String grade = null;
IMemberService mService = MemberService.getInstance();
MemberVO vo = mService.selectMemberInfo(memId);
	
	if(vo.getGr_no().equals("0")){
		grade = "준";
	}else {
		grade = "정";
	}
%>
    <div id="wrap">
        <div id="myProfile">
            <div id="profileDetail">
                <%
            if(vo.getMm_profile() == null) {
            	%>
                <img src="<%=request.getContextPath()%>/image/user-profile/icon-user-noimage.jpg" alt="icon-user-noimage.jpg">
            	<%
            } else {
            	%>
                <img src="<%=request.getContextPath()%>/images/<%=vo.getMm_profile() %>" alt="<%=vo.getMm_profile() %>">
            	<%
            }
            %> 
                 <span id="level"><%= grade %></span>
                <span id="nickName"><%= vo.getMm_nickname() %></span>
            </div>
        </div>
        <div id="container">
            <nav id="menu">
                <h3 class="menuTitle">마이페이지</h3>
                <ul id="mypage">
                    <li><a href="<%=request.getContextPath()%>/updateMemberInfoChkpass.do?id=<%=memId %>" class="active">회원정보 확인/수정</a></li>
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
                <a href="<%=request.getContextPath()%>/sub/faq/faq.jsp">
                    <i>
                        <img src="<%=request.getContextPath()%>/image/icon/icon-question.png" alt="question"> <span>자주 묻는 질문</span>
                    </i>
                </a>
                <a href="<%=request.getContextPath()%>/logout.do">
                    <i>
                        <img src="<%=request.getContextPath()%>/image/icon/icon-logout.png" alt="logout"> <span>로그아웃</span>
                    </i>
                </a>
            </nav>


            <div class="update">
                <p class="txt">회원 정보 확인/수정</p>
                </br></br>
                <p class="txt2">보안을 위해 비밀번호를 한번 더 입력해주세요</p>
                </br>
                    <form class="check" onsubmit="return false">
                        <input type="password" class="check2" id="user-pass"> 
                        <input type="button" value="확인" class="check3" id="btn-chkPw">
                    </form>
            </div>
        </div>



    </div>
    <footer id="footer"></footer>
    <script>
        // header & footer
        $("#footer").load("<%=request.getContextPath()%>/footer.jsp");
        
        // 비밀번호 확인 
        const passChk = $("#user-pass");
        const userPw = "<%= vo.getMm_password()%>";
        $("#btn-chkPw").on("click",function(e){
        	let pass = passChk.val();
        	if(pass.indexOf(userPw) == -1){
        		alert("비밀번호가 일치하지 않습니다.")
        	}else {
        		window.location.href = "<%= request.getContextPath() %>/updateMemberInfo.do?Id=<%=memId%>";
        	}
        })
        
    </script>
</body>
</html>