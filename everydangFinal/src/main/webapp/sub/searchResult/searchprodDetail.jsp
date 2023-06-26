<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>검색결과 더보기 | 에브리댕</title>
    <link rel="icon" href="/everydang/assets/favicon.ico">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/search/prodDetail.css">
    <script src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
</head>
<body>
<%@ include file="/header.jsp" %>
    <div id="wrap">
        <div class="container searchResult-wrap">
            <p id="superBoard">SEARCH</p>
            <div id="result-wrap">
                <div class="searchResultSummary">
                    <p class="search-info">
                        <span class="keyword">강아지</span> 전체게시판 검색결과
                        (총 <span id="board-count" class="count">00</span>건) 
                    </p>
                </div>
                <div id="prod">
                    <div id="prod-wrap">
                        <div class="prodPost" id="prdoPost1">
                            <a href="#">
                                <img src="<%=request.getContextPath() %>/image/sub/shop/shop-cart-prod1.png" alt="" class="prodimg">
                                <div class="prod-info">
                                    <span class="bedge">hot</span>
                                    <h3 class="prod-name" id="prod-name-1">강아지 인형 VER 1 - 강아지</h3>
                                    <p class="prod-price" id="prod-price-1">36,000</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer id="footer"></footer>
    <script src="<%=request.getContextPath() %>/js/common.js"></script>
    <script>
        $(function () {
            $("#footer").load("<%=request.getContextPath() %>/footer.jsp");
        })

        $(window).scroll(function () {
            $("#tagBox").css("margin-top", Math.max(0, 0 - $(this).scrollTop()));
        });
    </script>
</body>
</html>