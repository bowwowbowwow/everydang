<%@page import="com.everydang.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/login/login.css">
    <script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>

    <style>
        #mm_id{
            background-image : url('<%=request.getContextPath()%>/image/icon/icon-user.png');
            background-repeat : no-repeat;
            background-size : 15px;
            background-position: 7px;
            padding-left: 30px;

            
            
        }

        #mm_password {
            background-image : url('<%=request.getContextPath()%>/image/icon/icon-lock.png');
            background-repeat : no-repeat;
            background-size : 15px;
            background-position: 7px;
            padding-left: 30px;
        }

    </style>



</head>
<body>
<div class="wrap">
<%@ include file="/header.jsp" %>
    <div id="container"> 
    <img src="<%=request.getContextPath()%>/image/logo/logo-symbol.png" alt="logo-symbol" >

    
    <div id=loginform style="display: flex; flex-direction: column;">
       

        <form id="loginForm" action="<%=request.getContextPath()%>/login.do" method="post">
        
            <input type="text" id="mm_id" name="mm_id" placeholder="아이디"><br>
            <input type="password" id="mm_password" name="mm_password" placeholder="비밀번호"><br>
            <input type="submit" id="save" value="로그인"  style="color: white; background-color: #61BBB9;">
        </form>
        
       
        
    </div>

    <div id="signfindlink">
        
        <p> 아직 회원이 아니신가요? <a href="<%=request.getContextPath()%>/sub/member/join/join.jsp">회원가입</a> </p>
               
        <a href="<%=request.getContextPath()%>/sub/member/login/findId.jsp">아이디 찾기</a> <a href="<%=request.getContextPath()%>/sub/member/login/findPassword.jsp">비밀번호 찾기</a>
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