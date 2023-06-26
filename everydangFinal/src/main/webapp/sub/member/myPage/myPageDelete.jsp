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
    <title>myPageMain</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/myPage/myPageDelete.css">
    <script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
</head>
<body>
<%@ include file="/header.jsp" %>
<%
	String grade = null;
IMemberService mService = MemberService.getInstance();
MemberVO mvo = (MemberVO) request.getAttribute("selectMemberInfo");
	
	if(mvo.getGr_no().equals("0")){
		grade = "준";
	}else {
		grade = "정";
	}
%>
    <div id="wrap">
        <div id="myProfile">
            <div id="profileDetail">
            <%
            if(mvo.getMm_profile() == null) {
            	%>
                <img src="<%=request.getContextPath()%>/image/user-profile/icon-user-noimage.jpg" alt="icon-user-noimage.jpg">
            	<%
            } else {
            	%>
                <img src="<%=request.getContextPath()%>/images/<%=mvo.getMm_profile() %>" alt="<%=mvo.getMm_profile() %>">
            	<%
            }
            %> 
                <span id="level"><%=grade %></span>
                <span id="nickName"><%=mvo.getMm_nickname() %></span>
            </div>
        </div>
        <div id="container">
            <nav id="menu">
                <h3 class="menuTitle">마이페이지</h3>
                <ul id="mypage">
                    <li><a href="<%=request.getContextPath()%>/sub/member/myPage/myPageUpdate.jsp" class="active">회원정보 확인/수정</a></li>
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


            <div class="delete">
                <p class="txt">계정 삭제</p>
                </br></br>
                <p class="txt2">회원탈퇴를 위해 비밀번호를 한번 더 입력해주세요.</p>
                </br>
                    <form class="check">
                        <input type="password" class="check2" id="user-pass"> 
                        <input type="button" value="확인" class="check3" id="delete">
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
        const userPw = "<%= mvo.getMm_password()%>";
        
        $("#delete").on("click",function(e){
        	let pass = passChk.val();
        	if(pass.indexOf(userPw) == -1){
        		alert("비밀번호가 일치하지 않습니다.")
        	}else {
        		e.preventDefault();
            	$.ajax({
            		url : "<%= request.getContextPath()%>/deleteMemberInfo.do",
            		method : "get",
            		data : {"Id":"<%= mvo.getMm_id()%>"},
            		success : function(res){
            			alert("계정 삭제가 완료되었습니다.");
            			<%
            			session.setAttribute("Id", "guest");
            			session.setAttribute("grNo", "9");
            			%>
            			window.location.href = "<%=request.getContextPath() %>/login.do";
            		},
            		error : function(xhr, error){
            			console.log(xhr, error)
            		},
            		dataType : "Json"
            	})
        	}
        })
         
    </script>
</body>
</html>