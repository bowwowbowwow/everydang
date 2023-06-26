<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>findPassword</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/login/login.css">
    <script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>

<style>

</style>


</head>
<body>
	 <!-- 이메일 전송 성공 시 -->
    <% if (request.getAttribute("successMessage") != null) { %>
        <script>
            alert("<%= request.getAttribute("successMessage") %>");
        </script>
    <% } %>

    <!-- 이메일 전송 실패 시 -->
    <% if (request.getAttribute("errorMessage") != null) { %>
        <script>
            alert("<%= request.getAttribute("errorMessage") %>");
        </script>
    <% } %>



<%@ include file="/header.jsp" %>
<div class="wrap">
    <div id="container">
    <img src="<%=request.getContextPath()%>/image/logo/logo-symbol.png" alt="logo-symbol" >

    <div>
        <p class="find">비밀번호 찾기</p>
    </div>
    
    <div id=loginform style="display: flex; flex-direction: column;">
        <form id="loginForm" action="<%=request.getContextPath()%>/findPassword.do" method="post">
            <input type="text" id="name" name="mm_id" placeholder="아이디"><br>
            <input type="text" id="email" name="mm_mail" placeholder="이메일"><br>
            <input type="submit" id="save" value="비밀번호 찾기"  style="color: white; background-color: #61BBB9;">
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