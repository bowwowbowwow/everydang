<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>글쓰기 | 찾습니다</title>
    <link rel="icon" href="/everydang/assets/favicon.ico">
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
                <p>공지사항 글 쓰기</p>
            </div>
            <form action="<%=request.getContextPath() %>/noticeWrite.do" method="post" enctype="multipart/form-data" id="postWriteForm">
                <div id="writeForm">
                    <div id="subjectbox">
                        <label for="subject">제목</label><br>
                        <input type="text" name="ps_subject" id="subject" placeholder="제목을 입력하세요.">
                    </div>
                    <div id="contentBox">
                        <label for="summernote">본문</label><br>
                        <textarea id="summernote" name="ps_content"></textarea>
                    </div>
                    <div id="buttonBox">
                        <input type="button" value="취소" id="cancel" name="cancel">
                        <input type="button" value="등록" id="submit" name="submit">
                    </div>
                </div>
            </form>
        </div>
    </div>
    <footer id="footer"></footer>
    <script>
        $(function () {
            $("#footer").load("<%=request.getContextPath() %>/footer.jsp");
            $('#summernote').summernote({
          	  height: 450,
          	  lang: "ko-KR"
          	});
        })

        $("#cancel").on("click", function () {
            history.back();
        });
        
        $("#submit").on("click", function() {
        	inputData = {
        			"mm_id": "everydang",
        			"ps_subject": $("#subject").val(),
        			"ps_content": $("#summernote").val()
        	}
        	$.ajax({
        		url: `<%=request.getContextPath() %>/noticeWrite.do`,
        		data: inputData,
        		type: 'post',
        		success: function(res) {
        			if (res == "success") {
        				location.href = `<%=request.getContextPath() %>/noticeList.do`;
        			} else if (res) {
        				alter(res);
        			}
        		},
        		error: function(xhr, textStatus) {
        			console.log(xhr);
        			console.log(textStatus);
        		},
        		dataType: 'json'
        	});
		});
    </script>
</body>

</html>