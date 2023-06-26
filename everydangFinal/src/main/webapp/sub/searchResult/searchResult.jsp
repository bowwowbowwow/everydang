<%@page import="com.everydang.vo.ProductVO"%>
<%@page import="com.everydang.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>검색 | 에브리댕</title>
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
            <p id="superBoard"><a href="<%=request.getContextPath() %>/wikiBoard.jsp">SEARCH</a></p>
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
                            <a href="<%= request.getContextPath() %>/searchPostDetail.do?keyword=<%= request.getAttribute("SearchKeyword") %>" class="more">더보기</a>
                        </div>
                    </div>
                   
                    <div id="post">
                    <% if(searchList.size() == 0){ %>
                        <div class="searchnone">
                            <p>
                                검색 결과가 없습니다.
                            </p>
                        </div>
                    <% }else{ %>
                        <% for(int i = 0; i < searchList.size(); i++){
                        	if(i == 5) {
                        		break;
                       		}
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
                                    </a>
                                </div>
                            </div>
                        </div>
                    <% }
                        }%>
                    
                    </div>
                </div>
            <%
                List<ProductVO> prodList = (List<ProductVO>) request.getAttribute("SearchProdList");
                int prodCount = prodList.size();
            %>
                
                <div id="prodList">
                    <div class="writeSort">
                        <div class="searchResultSummary">
                            <p class="search-info">
                                상품
                                (총 <span id="board-count" class="count"><%=prodCount %></span>건) 
                            </p>
                            <a href="<%= request.getContextPath() %>/searchProdDetail.do?keyword=<%= request.getAttribute("SearchKeyword") %>" class="more">더보기</a>
                        </div>
                    </div>
                    <div id="prod">
                    <% if(prodList.size() == 0){ %>
                        <div class="searchnone">
                            <p>
                                검색 결과가 없습니다.
                            </p>
                        </div>
                    <% }else{ %>
                        <div class="prod-wrap">
                        <% for(int i = 0; i < prodList.size(); i++){
                        	if(i == 3) {
                        		break;
                       		}
                               ProductVO prodvo = prodList.get(i);
                        %>
                            <div class="prodPost" id="prodPost<%=i+1%>">
                                <a href="<%=request.getContextPath()%>/productOption.do?pr_code=<%=prodvo.getPr_code()%>">
                                    <img src="<%=request.getContextPath()%>/image/sub/shop/shop-main-prod8.png" alt="prod8" class="prodimg">
                                    <div class="prod-info">
                                        <span class="bedge">hot</span>
                                        <h3 class="prod-name" id="prod-name-1"><%= prodvo.getPr_name() %></h3>
                                        <p class="prod-price" id="prod-price-1"><%= prodvo.getPr_price() %></p>
                                    </div>
                                </a>
                            </div>
                        <% } %>
                        </div>
                    <% } %>
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