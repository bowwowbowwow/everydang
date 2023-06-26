<%@page import="com.everydang.vo.BoardVO" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <!DOCTYPE html>
 <html lang="ko">

 <head>
     <meta charset="UTF-8">
     <title>공지사항</title>
     <link rel="icon" href="/everydang/assets/favicon.ico">
     <link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/listBoard.css">
     <script src="<%= request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
 </head>

 <body>
<%@ include file="/header.jsp" %>
     <div id="wrap" class="notice">
         <div id="container">
             <div id="siteMapBox">
                 <div id="siteMap">
                     <a href="<%= request.getContextPath() %>/index.do"><img
                             src="<%= request.getContextPath() %>/image/icon/icon-home-blue.png"
                             alt="icon-home-blue.png" id="home"></a>
                     <img src="<%= request.getContextPath() %>/image/icon/icon-arrow-right.png"
                         alt="icon-arrow-right.png" class="arrow">
                     <a href="<%=request.getContextPath() %>/noticeList.do" class="siteMapBoard">공지사항</a>
                 </div>
             </div>
             <p id="superBoard"><a href="<%=request.getContextPath() %>/noticeList.do">NOTICE</a></p>
             <div id="postListBox">
                 <div id="postList">
                     <div id="writeSort">
                     <%
						if (!memId.equals("guest")) {
						%>
						<a href="<%=request.getContextPath() %>/noticeWrite.do" id="writeButton">
                             <img src="<%= request.getContextPath() %>/image/icon/icon-edit-blue.png"
                                 alt="icon-edit.png" id="writeIcon" />
                             작성하기
                         </a>
						<%
						} else {
						%>
						<div></div>
						<%
						}
						%>
                         
                     </div>
                     <div id="post">
			<% 
			List<BoardVO> noticeList = (List<BoardVO>) request.getAttribute("noticeList");
			for(int i = 0; i < noticeList.size(); i++) { BoardVO
			noticeVO=noticeList.get(i); %>
				<div class="post normal">
					<div class="writerDate">
						<a href="#" class="writer">
							<%=noticeVO.getMm_nickname() %>
						</a>
						<p class="date"><%=noticeVO.getPs_date() %></p>
						</div>
						<div class="contents">
								<a href="<%=request.getContextPath() %>/postRead.do?board=<%=noticeVO.getBr_code() %>&no=<%=noticeVO.getPs_no() %>" class="link">
									<p class="pSubject"><%=noticeVO.getPs_subject() %></p>
								</a>
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
             $("#footer").load("<%= request.getContextPath() %>/footer.jsp");
         })

         $(window).scroll(function () {
             $("#tagBox").css("margin-top", Math.max(0, 0 - $(this).scrollTop()));
         });
     </script>
 </body>

 </html>