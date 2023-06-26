<%@page import="com.everydang.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>findId</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/login/login.css">
    <script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
<%
 MemberVO vo = (MemberVO) request.getAttribute("save");
%>

</head>
<body>
<%@ include file="/header.jsp" %>
<div class="wrap">
    <div id="container">
    <img src="<%=request.getContextPath()%>/image/logo/logo-symbol.png" alt="logo-symbol" >

    <div>
        <p class="find">아이디 찾기</p>
    </div>
    
    <div id=loginform style="display: flex; flex-direction: column;">
        <form id="loginForm" method="post" action="<%=request.getContextPath()%>/findId.do">
            <input type="text" id="mm_name" name="mm_name" placeholder="이름"><br>
            <input type="text" id="mm_mail" name="mm_mail" placeholder="이메일"><br>
            <input type="submit" id="save" value="아이디 찾기"  style="color: white; background-color: #61BBB9;">
        </form>
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