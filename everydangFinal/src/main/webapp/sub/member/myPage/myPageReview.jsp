<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My 리뷰</title>
    <link rel="icon" href="/everydang/assets/favicon.ico">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/myPage/myPageReview.css">
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
                    <li><a href="<%=request.getContextPath()%>/sub/member/myPage/myPageOrder.jsp">my 주문</a></li>
                    <li><a href="<%=request.getContextPath()%>/sub/member/myPage/myPageReview.jsp" class="active">my 리뷰</a></li>
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
                <p class="postboardtxt">My 리뷰</p>
                <p class="postboardtxt2">총 <span class="spantext">1</span>개의 리뷰를 등록하셨습니다</p>
                <!-- 리뷰내용 -->
                <div class="reviewBox">
                    <div class="review">
                        <div class="content">
                            <div class="like">
                                <svg width="12" height="12" viewBox="0 0 12 12" fill="none"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <path
                                        d="M5.55342 1.71723C4.317 0.432695 2.31672 0.426452 1.08565 1.70543C-0.145412 2.9844 -0.139404 5.06253 1.09701 6.34706L5.67391 11.1021C5.86375 11.2993 6.17155 11.2993 6.3614 11.1021L10.9145 6.37455C12.1427 5.09142 12.1388 3.01912 10.9022 1.73436C9.66358 0.447532 7.66236 0.441288 6.42909 1.72255L5.99423 2.1752L5.55342 1.71723Z" />
                                </svg>
                                <svg width="12" height="12" viewBox="0 0 12 12" fill="none"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <path
                                        d="M5.55342 1.71723C4.317 0.432695 2.31672 0.426452 1.08565 1.70543C-0.145412 2.9844 -0.139404 5.06253 1.09701 6.34706L5.67391 11.1021C5.86375 11.2993 6.17155 11.2993 6.3614 11.1021L10.9145 6.37455C12.1427 5.09142 12.1388 3.01912 10.9022 1.73436C9.66358 0.447532 7.66236 0.441288 6.42909 1.72255L5.99423 2.1752L5.55342 1.71723Z" />
                                </svg>
                                <svg width="12" height="12" viewBox="0 0 12 12" fill="none"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <path
                                        d="M5.55342 1.71723C4.317 0.432695 2.31672 0.426452 1.08565 1.70543C-0.145412 2.9844 -0.139404 5.06253 1.09701 6.34706L5.67391 11.1021C5.86375 11.2993 6.17155 11.2993 6.3614 11.1021L10.9145 6.37455C12.1427 5.09142 12.1388 3.01912 10.9022 1.73436C9.66358 0.447532 7.66236 0.441288 6.42909 1.72255L5.99423 2.1752L5.55342 1.71723Z" />
                                </svg>
                                <svg width="12" height="12" viewBox="0 0 12 12" fill="none"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <path
                                        d="M5.55342 1.71723C4.317 0.432695 2.31672 0.426452 1.08565 1.70543C-0.145412 2.9844 -0.139404 5.06253 1.09701 6.34706L5.67391 11.1021C5.86375 11.2993 6.17155 11.2993 6.3614 11.1021L10.9145 6.37455C12.1427 5.09142 12.1388 3.01912 10.9022 1.73436C9.66358 0.447532 7.66236 0.441288 6.42909 1.72255L5.99423 2.1752L5.55342 1.71723Z" />
                                </svg>
                                <svg width="12" height="12" viewBox="0 0 12 12" fill="none"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <path
                                        d="M5.55342 1.71723C4.317 0.432695 2.31672 0.426452 1.08565 1.70543C-0.145412 2.9844 -0.139404 5.06253 1.09701 6.34706L5.67391 11.1021C5.86375 11.2993 6.17155 11.2993 6.3614 11.1021L10.9145 6.37455C12.1427 5.09142 12.1388 3.01912 10.9022 1.73436C9.66358 0.447532 7.66236 0.441288 6.42909 1.72255L5.99423 2.1752L5.55342 1.71723Z" />
                                </svg>
                            </div>
                            <h3 class="reviewTitle">에브리댕 강아지 옷</h3>
                            <span class="date">2023-06-20</span>
                            <p class="textellipsis">옷이 정말 귀여워요! </p>
                            <form class="btnBox">
                                <button type="button" id="delete">삭제</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
<footer id="footer"></footer>
<script>
    // header & footer
    $("#footer").load("<%=request.getContextPath()%>/footer.html");
    
    $("#delete").on("click",function(){
    	const txt = "<p style='text-align:center; margin-top:20rem'>등록된 리뷰가 없습니다.<p>"
    	$(".reviewBox").html(txt);
    	$(".spantext").text("0");
    })
</script>
</body>

</html>