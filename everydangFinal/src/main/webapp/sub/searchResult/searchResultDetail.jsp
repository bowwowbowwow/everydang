<%@page import="com.everydang.vo.BoardVO"%>
<%@page import="java.util.List"%>
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
<%
		String userId = (String) session.getAttribute("memId");
%>
    <header id="header"></header>
    <div id="wrap">
        <div id="container">
            <div id="siteMapBox">
                <!-- 공간만 차지 -->
            </div>
            <p id="superBoard"><a href="#">SEARCH</a></p>
            <%
            List<BoardVO> searchList = (List<BoardVO>) request.getAttribute("SearchPostList");
            int count = searchList.size();
        	%>
            <div id="postListBox" class="searchListBox">
                <div id="postList">
                    <div class="writeSort">
                        <div class="searchResultSummary">
                            <p class="search-info">
                               <span class="keyword"><%= request.getAttribute("SearchKeyword")%></span> 전체게시판 검색결과
                                (총 <span id="board-count" class="count"><%= count %></span>건) 
                            </p>
                        </div>
                    </div>
                    <div id="post">
                        <% for(int i = 0; i < searchList.size(); i++){
                                BoardVO vo = searchList.get(i);
                        %>
                        <div class="normalPost" id="normalPost<%=i+1%>">
                            <div id="writerDate">
                                <a href="#" id="writer"><%= vo.getMm_nickname()  %></a>
                                <p id="date"><%=vo.getPs_date() %></p>
                            </div>
                            <div id="contentBox">
                                <div id="contents">
                                    <a href="<%=request.getContextPath()%>/productOption.do?pr_code=<%=vo.getBr_code()%>">
                                        <p id="pSubject"><%= vo.getPs_subject() %> 
                                        </p>
                                        <p id="pContent"><%=vo.getPs_content() %></p>
                                    </a>
                                </div>
                            </div>
                        </div>
                         <% }%>
                    </div>
                </div>
            </div>
        </div>

    </div>


    <footer id="footer"></footer>
    <script src="<%=request.getContextPath() %>/js/common.js"></script>
    <script>
	    $("#header").load("<%=request.getContextPath() %>/header.jsp");
	    $("#footer").load("<%=request.getContextPath() %>/footer.jsp");
    </script>
</body>
</html>