<%@page import="com.everydang.vo.PostVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>글수정 | 공지사항</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/board/postWrite.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/sub/board/summernote/summernote-lite.css">
	<script src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
	<script src="<%=request.getContextPath() %>/sub/board/summernote/summernote-lite.js"></script>
	<script src="<%=request.getContextPath() %>/sub/board/summernote/summernote-ko-KR.js"></script>
	<script src="<%=request.getContextPath() %>/sub/board/summernote/summernote-lite.js.map"></script>
</head>

<body>
<%@ include file="/header.jsp" %>
    <div id="wrap">
        <div id="container">
            <div id="category">
                <p>공지사항 글 수정</p>
            </div>
            <%
            PostVO vo = (PostVO) request.getAttribute("modifyVO");
            %>
                <div id="writeForm" idx=<%=vo.getPs_no() %>>
                    <div id="subjectbox">
                        <label for="subject">제목</label><br>
                        <input type="text" id="subject" placeholder="제목을 입력하세요." value="<%=vo.getPs_subject() %>">
                    </div>
                    <div id="contentBox">
                        <label for="content">본문</label><br>
						<textarea id="summernote"><%=vo.getPs_content() %></textarea>
                    </div>
                    <div id="buttonBox">
                        <input type="button" value="취소" id="cancel">
                        <input type="button" value="수정" id="submit">
                    </div>
                </div>
        </div>
    </div>
    <footer id="footer"></footer>
    <script>
        $(function () {
            $("#footer").load("<%= request.getContextPath() %>/footer.jsp");
            $('#summernote').summernote({
	          	  height: 450,
	          	  lang: "ko-KR"
	         });
        })
        
        $("#submit").on("click", function() {
        	inputData = {
    				"ps_no": $("#writeForm").attr("idx"),
    				"ps_subject": $("#subject").val(),
    				"ps_content": $("#summernote").val(),
    				"br_code": "notice"
    			}
    			$.ajax({
    				url: "<%=request.getContextPath() %>/bowwowModify.do",
    				type: 'post',
    				data: inputData,
    				success: function(res) {
    					location.href = "<%=request.getContextPath() %>/noticeRead.do?no=<%=vo.getPs_no() %>"; 
    				},
    				error: function(xhr, status) {
    					console.log(xhr, status);
    				},
    				dataType: 'json'
    			});
        });

        $("#cancel").on("click", function () {
            history.back();
        });
    </script>
</body>

</html>