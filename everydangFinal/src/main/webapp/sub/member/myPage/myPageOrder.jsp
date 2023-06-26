<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>myPageOrder</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/myPage/myPageOrder.css">
    <script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
</head>
<body>
<%@ include file="/header.jsp" %>
    <div id="wrap">
        <div id="myProfile">
            <div id="profileDetail">
                <img src="<%=request.getContextPath()%>/image/user-profile/icon-user-noimage.jpg" alt="icon-user-noimage.jpg">
                <span id="level">정</span>
                <span id="nickName">김대덕</span>
            </div>
        </div>
        <div id="container">
           <nav id="menu">
                <h3 class="menuTitle">마이페이지</h3>
                <ul id="mypage">
                    <li><a href="<%=request.getContextPath()%>/sub/member/myPage/myPageUpdate.jsp">회원정보 확인/수정</a></li>
                </ul>
                <h3 class="menuTitle">내 활동</h3>
                <ul id="myactivity">
                    <li><a href="<%=request.getContextPath()%>/myPost.do?id=<%=memId%>">my 글</a></li>
                    <li><a href="<%=request.getContextPath()%>/myComment.do?id=<%=memId%>">my 댓글</a></li>
                    <li><a href="<%=request.getContextPath()%>/myScrap.do?id=<%=memId%>">스크랩</a></li>
                </ul>
                <h3 class="menuTitle">내 쇼핑</h3>
                <ul id="myactivity">
                    <li><a href="<%=request.getContextPath()%>/sub/member/myPage/myPageOrder.jsp" class="active">my 주문</a></li>
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
            <div class="postboard">
              
                <div class="orderBox">
                    <a href="<%=request.getContextPath()%>/sub/member/myPage/myShopping.jsp" class="orderNo">A152348019</a>
                    <h2 class="orderTitle">에브리댕 강아지 옷</h2>
                    <span class="date">2023-06-20</span>
                </div>
            </div>
        </div>
    </div>
    <footer id="footer"></footer>
    <script>
        // header & footer
        $("#footer").load("<%=request.getContextPath()%>/footer.html");
    </script>
</body>
</html>