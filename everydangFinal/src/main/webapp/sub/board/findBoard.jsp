<%@page import="com.everydang.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>찾습니다 | 에브리댕</title>
<link rel="icon" href="/everydang/assets/favicon.ico">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/board/listBoard.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
</head>

<body>
	<%@ include file="/header.jsp" %>
	<div id="wrap" class="find">
		<div id="container">
			<div id="siteMapBox">
				<div id="siteMap">
					<a href="<%=request.getContextPath() %>/index.do"><img
						src="<%=request.getContextPath() %>/image/icon/icon-home-red.png" alt="icon-home-red.png"
						id="home"></a> <img src="<%=request.getContextPath() %>/image/icon/icon-arrow-right.png"
						alt="icon-arrow-right.png" class="arrow"> <a
						href="<%=request.getContextPath() %>/findList.do?board=find" class="siteMapBoard">찾습니다</a>
				</div>
			</div>
			<p id="superBoard">
				<a href="<%=request.getContextPath() %>/findList.do?board=find">찾습니다</a>
			</p>
			<div id="postListBox">
				<div id="writeSort">
					<a href="wikiWrite.jsp" id="writeButton">
                            <img src="<%=request.getContextPath() %>/image/icon/icon-edit-red.png" alt="icon-edit.png" id="writeIcon" />
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
									<p class="pContent"><%=noticeVO.getPs_content() %></p>
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
						List<BoardVO> findList = (List<BoardVO>) request.getAttribute("findList");
						for (int i = 0; i < findList.size(); i++) {
							BoardVO findVO = findList.get(i);
						%>
						<div class="post normal" idx="<%=findVO.getPs_no() %>"> 
							<div class="writerDate" >
							<%
							if (findVO.getMm_nickname() == null) {
							%>
								<p class="writer">(정보가 존재하지 않는 회원입니다.)</p>
							<%
							} else {
							%>
								<a href="#" class="writer"><%=findVO.getMm_nickname() %></a>
							<%
							}
							%>
								<p class="date"><%=findVO.getPs_date() %></p>
							</div>
							<div class="contentBox">
								<div class="contents">
									<a href="<%=request.getContextPath() %>/postRead.do?board=<%=findVO.getBr_code() %>&no=<%=findVO.getPs_no() %>" class="link">
										<p class="pSubject"><%=findVO.getPs_subject() %></p>
										<p class="pContent"><%=findVO.getPs_content() %></p>
									</a>
								</div>
								<div class="likeCommentBox">
									<div class="likeComment">
										<img src="<%=request.getContextPath() %>/image/icon/icon-like-on.png" alt="icon-like-on.png" class="like">
										<span class="countLike"><%=findVO.getLk_like() %></span> 
										<img src="<%=request.getContextPath() %>/image/icon/icon-comment-black.png" alt="icon-comment-black.png" class="comment">
										<span class="countComment"><%=findVO.getCm_no() %></span>
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
		$(function() {
			$("#footer").load("<%=request.getContextPath() %>/footer.jsp");
		});
		
		$("#sort").on("change", function() {
			optionValue = $("option:selected", this).text();
			inputData = {
					"mm_nickname": $(".writer").val(),
					"ps_date": $(".date").val(),
					"ps_subject": $(".subject").val(),
					"ps_content": $(".content").val(),
					"lk_like": $(".countLike").val(),
					"cm_no": $(".countComment").val(),
					"ps_no": $(".normal").attr('idx'),
					"optionValue": optionValue
			}
		
			if (optionValue == "날짜순") {
				selectSortedPost();
			} else if (optionValue == "좋아요순") {
				selectSortedPost();
			} else if (optionValue == "댓글순") {
				selectSortedPost();
			}
			
			selectSortedPost = function() {
				selectSortedPost = function() {
					$.ajax({
						url: `<%=request.getContextPath() %>/boardSort.do`,
						data: inputData,
						type: 'post',
						success: function(res) {
							$(".normal").remove();
							code = ``;
							$.each(res, function(i, v) {
								code += `
									<div class='post normal' idx=\${v.ps_no}>
										<div class="writerDate">
											<a href="${projectPath}/selectMemberInfo.do?Id=\${v.mm_id}" class="writer">\${v.mm_nickname}</a>
											<p class="date">\${v.ps_date}</p>
										</div>
										<div class="contentBox">
											<div class="contents">
								 				<a href="${projectPath}/postRead.do?board=\${v.br_code}&no=\${v.ps_no}" class="link"> 
								 					<p class="pSubject">\${v.ps_subject}</p>
								 					<p class="pContent">\${v.ps_content}</p>
												</a>
											</div>
											<div class="likeCommentBox">
												<div class="likeComment">
								 						<img src="${projectPath}/image/icon/icon-like-on.png" alt="icon-like-on.png" class="like"> 
													<span class="countLike">\${v.lk_like}</span> 
								 						<img src="${projectPath}/image/icon/icon-comment-black.png" alt="icon-comment-black.png" class="comment">
													<span class="countComment">\${v.cm_no}</span>
												</div>
											</div>
										</div>
									</div>`;
							});
							$("#post").append(code);
						},
						error: function(xhr, status) {
							console.log(xhr);
							console.log(status);
						},
						dataType: 'json'
					});
				}	
			};
		});
	</script>
</body>

</html>