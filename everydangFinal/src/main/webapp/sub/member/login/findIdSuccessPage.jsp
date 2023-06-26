<%@page import="com.everydang.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>findIdSuccessPage</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/login/login.css">
    <script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>


</head>
<%
 MemberVO vo = (MemberVO) request.getAttribute("save");
%>


<body>
<%@ include file="/header.jsp" %>
<div class="wrap">
    <div id="container">
    <img src="<%=request.getContextPath()%>/image/logo/logo-symbol.png" alt="logo-symbol" >

    <div>
        <h1>아이디 찾기</h1>
    </div>
    
    <div id=loginform style="display: flex; flex-direction: column;">
            <div style="text-align: left; font-size: 1.3rem; color: gray; margin: 20px;">
                <p>해당 아이디는 <br><br> <span style="font-size: 1.8rem; color: #61BBB9;">  <%=vo.getMm_id()%> </span> 입니다.</p>
            </div>
                <form action="<%=request.getContextPath()%>/sub/member/login/logIn.jsp">
                    <input type="submit" value="로그인"  style="color: white; background-color: #61BBB9;">
                </form>
    </div>

    <div id="signfindlink">
        <br>
        <p> 비밀번호가 기억 안 나시나요? <a href="<%=request.getContextPath()%>/sub/member/login/findPassword.jsp">비밀번호 찾기</a> </p>
    </div>

    </div>
</div>

<footer id="footer"></footer>
<script>
    // header & footer
    $("#footer").load("<%=request.getContextPath()%>/footer.jsp");
</script>
</body>
</html>