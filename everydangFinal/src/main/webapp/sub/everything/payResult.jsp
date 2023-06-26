<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 완료 | 에브리띵</title>
    <link rel="icon" href="/everydang/assets/favicon.ico">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/everything/payResult.css">
    <script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
</head>
<body>
<%@ include file="/header.jsp" %>	
    <div id="wrap">
        <main>
            <div class="main-wrap">
                <div class="logo-area">
                    <img src="<%=request.getContextPath()%>/image/logo/logo-symbol.png">
                </div>
                <p>주문이 완료되었습니다.</p>
                <div class="btn-wrap">
                    <a href="<%=request.getContextPath()%>/index.do" class="btn btn-main">메인으로 이동</a>
                    <a href="<%=request.getContextPath()%>/sub/member/myPage/myPageOrder.jsp" class="btn btn-info">주문내역으로 이동</a>
                </div>
            </div>
        </main>
        <div id="footer"></div>
    </div>
    <script src="<%=request.getContextPath()%>/js/common.js"></script>
	<script>
        // header & footer
        $("#footer").load("<%=request.getContextPath()%>/footer.jsp");
    </script>
</body>
</html>