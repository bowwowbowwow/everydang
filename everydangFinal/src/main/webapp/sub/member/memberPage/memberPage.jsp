<%@page import="com.everydang.vo.PostVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 페이지 | 에브리댕</title>
<link rel="icon" href="/everydang/assets/favicon.ico">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/memberPage/memberPage.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
</head>
<body>
<%@ include file="/header.jsp" %>
<%
List<PostVO> list = (List<PostVO>) request.getAttribute("postList");

String mmId = list.get(0).getMm_id();
String nickname = list.get(0).getMm_nickname();
String profile = list.get(0).getMm_profile();
int gr_no = list.get(0).getGr_no();
String grade = null;
if(gr_no == 0) grade = "준";
else if(gr_no == 1) grade = "정";

%>
	<div class="wrap">
			<div id="infobox">
				<div class="memberInfo">
					<img id="profile"
						src="<%=request.getContextPath()%>/image/user-profile/<%=profile%>"
						alt="profile"> 
					<span id="level"><%=grade %></span>
					<p id="membername"><%=nickname%></p>
					<button type="button" id="noti" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    신고
                	</button>
				</div>
			</div>
	
		<div class="container">
			<div class="containerbox">
				<div class="postboard">
					<p class="postboardtxt">게시글</p>
					<br>
					<p class="postboardtxt2">
						총 <span class="spantext"><%=list.size() %></span>개의 글을 작성하셨습니다
					</p>

					<%
					for (int i=0; i<list.size(); i++){
						PostVO vo = list.get(i);
					%>
					<a href="#" class="post">
						<div class="title"><%=vo.getPs_subject()%></div>
						<div class="date"><%=vo.getPs_date() %></div>
						<br>
					</a>
					<%
					}
					%>
				</div>
				
			</div>
		</div>
	</div>


	<footer id="footer"></footer>

	<!-- Modal -->

	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="modal-title">신고하기</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="modal-body-top">
						<p class="info">
							<span id="user"><%=nickname %>(<%=mmId %>)</span>님을 신고합니다.
						</p>
					</div>
					<div class="modal-form">
					 <form action="<%=request.getContextPath()%>/insertReportMember.do?rp_reporter=<%=memId %>&rp_defendent=<%= mmId%>" id="declaration-form" enctype="multipart/form-data" method="post">
                        <fieldset>
                            <h2 class="form-title">신고사유 선택</h2>
                            <ul>
                                <li>
                                    <input type="radio" name="declaration" class="declaration" id="dec-1" value="욕설, 비방, 차별 ,혐오">
                                    <label for="dec-1" class="radio-label" for="dec-1">욕설, 비방, 차별 ,혐오</label>
                                </li>
                                <li>
                                    <input type="radio" name="declaration" class="declaration" id="dec-2" value="홍보, 영리목적">
                                    <label for="dec-2" class="radio-label" for="dec-2">홍보, 영리목적</label>
                                </li>
                                <li>
                                    <input type="radio" name="declaration" class="declaration" id="dec-3" value="불법 정보">
                                    <label for="dec-3" class="radio-label" for="dec-3">불법 정보</label>
                                </li>
                                <li>
                                    <input type="radio" name="declaration" class="declaration" id="dec-4" value="음란, 청소년 유해">
                                    <label for="dec-4" class="radio-label" for="dec-4">음란, 청소년 유해</label>
                                </li>
                                <li>
                                    <input type="radio" name="declaration" class="declaration" id="dec-5" value="개인 정보 노출, 유포, 거래">
                                    <label for="dec-5" class="radio-label" for="dec-5">개인 정보 노출, 유포, 거래</label>
                                </li>
                                <li>
                                    <input type="radio" name="declaration" class="declaration" id="dec-6" value="도배, 스팸">
                                    <label for="dec-6" class="radio-label" for="dec-6">도배, 스팸</label>
                                </li>
                                <li id="dec-7-wrap">
                                    <div>
                                        <input type="radio" name="declaration" class="declaration" id="dec-7" value="기타">
                                        <label for="dec-7" class="radio-label" for="dec-7">기타</label>
                                    </div>
                                    <div class="textArea-wrap">
                                        <textarea id="textArea" name="textArea" style="width: 100%;" placeholder="신고 사유 직접 입력 (최대 100자)"></textarea>
                                    </div>
                                </li>
                            </ul>
                        </fieldset>
                        <fieldset>
                            <div class="file-top">
                                <h2 class="form-title">첨부파일</h2>
                                <input type="file" name="decFile" id="dec-file">
                            </div>
                        </fieldset>
                    <div class="btn-wrap">
                        <button type="submit" class="btn btn-primary" id="decBtn">신고하기</button>
                    </div>
                    </form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>




	<script>
		// header & footer
		$("#footer").load("<%=request.getContextPath()%>/footer.jsp");
		
		<% String result = (String) request.getAttribute("result"); %>
		console.log(<%=result%>);
		
		$("#")
	</script>
</body>
</html>