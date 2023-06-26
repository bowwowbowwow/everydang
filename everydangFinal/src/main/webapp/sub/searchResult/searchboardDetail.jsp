<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>검색결과 더보기 | 에브리댕</title>
    <link rel="icon" href="/everydang/assets/favicon.ico">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/search/searchResult.css">
    <script src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
</head>
<body>
<%@ include file="/header.jsp" %>
    <div id="wrap">
        <div id="container">
            <div id="siteMapBox">
                <!-- 공간만 차지 -->
            </div>
            <p id="superBoard"><a href="#">SEARCH</a></p>
            <div id="postListBox" class="searchListBox">
                <div id="postList">
                    <div class="writeSort">
                        <div class="searchResultSummary">
                            <p class="search-info">
                                <span class="keyword">강아지</span> 전체게시판 검색결과
                                (총 <span id="board-count" class="count">00</span>건) 
                            </p>
                        </div>
                    </div>
                    <div id="post">
                        <div class="normalPost" id="normalPost1">
                            <div id="writerDate">
                                <a href="#" id="writer">시고르자브종</a>
                                <p id="date">2023-05-24</p>
                            </div>
                            <div id="contentBox">
                                <div id="contents">
                                    <a href="./wikiRead.html">
                                    <p id="pSubject">이불'만'물어뜯는 <span class="keyword">강아지</span> 따로자야할까요
                                    </p>
                                    <p id="pContent">인생의 봄바람을 내려온 기관과 군영과 이상의
                                            인생에 옷을 반짝이는
                                            사막이다.
                                            유소년에게서
                                            우리 간에 따뜻한 청춘을 어디 천지는 관 현악이며, 봄바람이다. 이상은 같은 가는 찾아다녀도, 그것은 앞이 하였으며, 붙잡아
                                            것이다.
                                            않는
                                            고동을
                                            원질이 청춘의 봄바람이다. 더 운지라 청춘 가치를 그러므로 발휘하기 얼마나 이상, 위하여서...</p>
                                    </a>
                                </div>
                            </div>
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