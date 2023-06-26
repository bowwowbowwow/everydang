<%@page import="com.everydang.vo.PostVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>글확인 | 공지사항</title>
    <link rel="icon" href="/everydang/assets/favicon.ico">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/postRead.css">
    <script src="<%= request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
</head>

<body>
<%@ include file="/header.jsp" %>
    <div id="wrap">
        <div id="container">
            <div id="postBox">
                <div id="category">
                    <a href="<%=request.getContextPath() %>/noticeList.do">공지사항 ></a>
                </div>
                <%
                PostVO vo = (PostVO) request.getAttribute("selectPost"); 
                %>
                <form id="">
                <div id="postHeader">
                    <p id="subject"><%=vo.getPs_subject() %></p>
                    <div id="postWriterInfoBox">
                        <div id="postWriterInfo">
                            <img src="<%= request.getContextPath() %>/image/user-profile/icon-user-profile1.png" alt="icon-user-profile1.png">
                            <div id="postWriterDate">
                                <p><a href="#" id="postWriter"><%=vo.getMm_nickname() %></a></p>
                                <p id="postDate"><%=vo.getPs_date() %></p>
                            </div>
                        </div>
                        <div id="postTopButtons">
                            <img src="<%= request.getContextPath() %>/image/icon/icon-hit.png" alt="icon-hit.png" class="img">
                            <p id="hitCount" class="count"><%=vo.getPs_hit() %></p>
                        </div>
                    </div>
                </div>
                </form>
                <div id="postBody">
                    <div id="postContentBox">
                        <p id="postContent"><%=vo.getPs_content() %></p>
                    </div>
                </div>
                <div id="postFooter">
                    <div id="tags">
                    </div>
                    <div id="postBottomButtons">
                        <input type="submit" value="수정" id="postModify" name="postModify">
                        <input type="button" value="삭제" id="postDelete" name="postDelete">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer id="footer"></footer>
    <script>
        $(function () {
            $("#footer").load("<%=request.getContextPath()%>/footer.jsp");
            
            nowId = "<%=memId%>";
 			if(nowId == "everydang") {
 				$("#postModify").addClass("on");
 				$("#postDelete").addClass("on");
 			} 
        });

        $("#postModify").on("click", function () {
        	location.href = "<%=request.getContextPath()%>/postModifing.do?no=<%=vo.getPs_no()%>";
        });

        $("#postDelete").on("click", function () {
            vdelete = confirm("해당 글을 삭제하시겠습니까?");
            if (vdelete == true) {
	        	location.href = "<%=request.getContextPath()%>/postDelete.do?no=<%=vo.getPs_no()%>&id=<%=vo.getMm_id()%>&board=<%=vo.getBr_code() %>";
			}
		})
	</script>
</body>

</html>