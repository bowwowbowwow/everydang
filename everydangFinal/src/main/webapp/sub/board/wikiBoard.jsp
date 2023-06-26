<%@page import="com.everydang.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>멍멍위키</title>
    <link rel="icon" href="/everydang/assets/favicon.ico">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/board/listBoard.css">
    <script src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
</head>

<body>
<%@ include file="/header.jsp" %>
    <div id="wrap" class="wiki">
        <div id="container">
            <div id="siteMapBox">
                <div id="siteMap">
                    <a href="<%=request.getContextPath() %>/index.do"><img src="<%=request.getContextPath() %>/image/icon/icon-home-green.png" alt="icon-home-blue.png"
                            id="home"></a>
                    <img src="<%=request.getContextPath() %>/image/icon/icon-arrow-right.png" alt="icon-arrow-right.png" class="arrow">
                    <a href="<%=request.getContextPath() %>/wikiList.do?board=wiki" class="siteMapBoard">멍멍위키</a>
                </div>
            </div>
            <p id="superBoard"><a href="<%=request.getContextPath() %>/wikiList.do?board=wiki">멍멍위키</a></p>
            <div id="postListBox">
                <div id="postList">
                    <div id="writeSort">
                        <a href="wikiWrite.jsp" id="writeButton">
                            <img src="<%=request.getContextPath() %>/image/icon/icon-edit-green.png" alt="icon-edit.png" id="writeIcon" />
                            작성하기
                        </a>
                        <select name="sort" id="sort">
                            <option value="dateSort" id="dateSort" selected>날짜순</option>
                            <option value="likeSort" id="likeSort">좋아요순</option>
                            <option value="commentSort" id="commentSort">댓글순</option>
                        </select>
                    </div>
                    <div id="post">
                    <%
						List<BoardVO> noticeList = (List<BoardVO>) request.getAttribute("noticeList");
					if(noticeList != null && noticeList.size() != 0){
						for(int i = 0; i < noticeList.size(); i++) {
							BoardVO noticeVO = noticeList.get(i);
					%>
						<div class="post announce" idx="<%=noticeVO.getPs_no() %>">
							<div class="writerDate"> 
								<a href="#" class="writer"><%=noticeVO.getMm_nickname() %></a>
								<p class="date"><%=noticeVO.getPs_date() %></p>
							</div>
							<div class="contents">
								<a href="<%=request.getContextPath() %>/postRead.do?board=<%=noticeVO.getBr_code() %>&no=<%=noticeVO.getPs_no() %>" class="link">
									<p class="pSubject"><%=noticeVO.getPs_subject() %></p>
								</a>
							</div>
						</div>
						<%
						}
					}else {
						%>
						<div class="post announce"></div>
						<%
						}
						List<BoardVO> wikiList = (List<BoardVO>) request.getAttribute("wikiList");
						for (int i = 0; i < wikiList.size(); i++) {
							BoardVO wikiVO = wikiList.get(i);
						%>
						<div class="post normal" idx="<%=wikiVO.getPs_no() %>"> 
							<div class="writerDate" >
							<%
							if (wikiVO.getMm_nickname() == null) {
							%>
								<p class="writer">(정보가 존재하지 않는 회원입니다.)</p>
							<%
							} else {
							%>
								<a href="#" class="writer"><%=wikiVO.getMm_nickname() %></a>
							<%
							}
							%>
								<p class="date"><%=wikiVO.getPs_date() %></p>
							</div>
							<div class="contentBox">
								<div class="contents">
									<a href="<%=request.getContextPath() %>/postRead.do?board=<%=wikiVO.getBr_code() %>&no=<%=wikiVO.getPs_no() %>" class="link">
										<p class="pSubject"><%=wikiVO.getPs_subject() %></p>
									</a>
								</div>
								<div class="likeCommentBox">
									<div class="likeComment">
										<img src="<%=request.getContextPath() %>/image/icon/icon-like-on.png" alt="icon-like-on.png" class="like">
										<span class="countLike"><%=wikiVO.getLk_like() %></span> 
										<img src="<%=request.getContextPath() %>/image/icon/icon-comment-black.png" alt="icon-comment-black.png" class="comment">
										<span class="countComment"><%=wikiVO.getCm_no() %></span>
									</div>
								</div>
							</div>
						</div>
						<%} %>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer id="footer"></footer>
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