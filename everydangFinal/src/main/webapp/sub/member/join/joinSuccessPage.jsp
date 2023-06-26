<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/login/login.css">
	<script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
<style>

</style>


</head>
<body>
<%@ include file="/header.jsp" %>
<div class="wrap">
    <div id="container" style="width: 400px;">
    <img src="<%=request.getContextPath()%>/image/logo/logo-symbol.png" alt="logo-symbol" >

    <div>
        <h1 style="color: var(--color-blue);">회원가입 완료</h1>
    </div>
    
    <div id=loginform style="display: flex; flex-direction: column;">
            <div style="text-align: center; font-size: 1.3rem; color: gray; margin : 20px;">
                <p>환영합니다!</p><br><p>에브리댕과 함께 다양한 댕댕이 친구들과 소통해보세요</p>
            </div>
                <form action="<%=request.getContextPath()%>/sub/member/login/logIn.jsp">
                    <input type="submit" value="로그인" onclick="url()"  style="color: white; background-color: #61BBB9;">
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