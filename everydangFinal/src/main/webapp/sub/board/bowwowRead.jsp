<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.everydang.vo.CommentVO"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.everydang.post.service.PostService"%>
<%@page import="com.everydang.post.service.IPostService"%>
<%@page import="com.everydang.vo.PostVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>글확인 | 멍멍게시판</title>
<link rel="icon" href="/everydang/assets/favicon.ico">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/board/postRead.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
</head>

<body>
	<%@ include file="/header.jsp" %>
	<div id="wrap">
		<div id="container">
			<div id="postBox">
				<div id="category">
					<a href="<%=request.getContextPath() %>/bowwowList.do">멍멍게시판 ></a>
				</div>
				<%
					PostVO vo = (PostVO) request.getAttribute("selectPost");
					int count = (Integer) request.getAttribute("hit");
					
					IPostService pService = PostService.getInstance();
					PostVO nowMember = pService.selectMemberInfo(memId);
					if (nowMember == null) {
						nowMember = new PostVO();
						nowMember.setMm_id(memId);
						nowMember.setMm_nickname(memId);
					}
				%>
				<div id="postHeader">
					<p id="subject"><%=vo.getPs_subject() %></p>
					<div id="postWriterInfoBox">
						<div id="postWriterInfo">
							<%
						if (vo.getMm_nickname() != null) {
							if (vo.getMm_profile() == null || vo.getMm_profile().equals("filepath")) {
								%>
							<img
								src="<%=request.getContextPath() %>/image/user-profile/icon-user-noimage.jpg"
								alt="icon-user-profile1.png">
								<%
							} else {
								%>
							<img
								src="<%=request.getContextPath() %>/images/<%=vo.getMm_profile() %>"
								alt="icon-user-profile1.png">
								<%
							}
							%>
							<div id="postWriterDate">
								<p>
									<p id="postWriter"><%=vo.getMm_nickname() %></p>
								</p>
								<p id="postDate"><%=vo.getPs_date() %></p>
							</div>
							<%
						} else {
							%>
							<img
								src="<%=request.getContextPath() %>/image/user-profile/icon-user-noimage.jpg">
							<div id="postWriterDate">
								<p>
									<a href="#" id="postWriter">(정보가 존재하지 않는 회원입니다.)</a>
								</p>
								<p id="postDate"><%=vo.getPs_date() %></p>
							</div>
							<%
						}
						%>
						</div>
						<div id="postTopButtons">
							<img src="<%=request.getContextPath() %>/image/icon/icon-hit.png"
								alt="icon-hit.png" class="img">
							<p id="hitCount" class="count"><%=vo.getPs_hit() %></p>
							<input type="button" id="like" name="like">
							<p id="likeCount" class="count"><%=vo.getLk_like() %></p>
							<img
								src="<%=request.getContextPath() %>/image/icon/icon-comment-black.png"
								alt="icon-comment-black.png" class="img">
							<p id="commentCount" class="count"><%=vo.getCm_no() %></p>
							<input type="button" id="scrap" name="scrap">
						</div>
					</div>
				</div>
				<div id="postBody">
					<div id="postContentBox">
						<p id="postContent"><%=vo.getPs_content() %></p>
					</div>
				</div>
				<div id="postFooter">
					<div id="tags"></div>
					<div id="postBottomButtons">
						<input type="button" value="수정" id="postModify" name="postModify">
						<input type="button" value="삭제" id="postDelete" name="postDelete">
					</div>
				</div>
			</div>
			<div id="commentBox">
			<%
			if (!memId.equals("guest")) {
				%>
				<div id="contentWriteArea">
					<div id="commentWriterInfoBox">
						<div class="commentWriterInfo">
							<img
								src="<%=request.getContextPath() %>/image/user-profile/icon-user-profile1.png"
								alt="icon-user-profile1.png">
							<div class="commentWriterDate">
								<a href="#" class="commentWriter" id="commentUser"><%=nowMember.getMm_nickname() %></a>
								<p class="commentDate">
									<%
							        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
							        String formatedNow = LocalDate.now().format(formatter);
									%>
									<%=formatedNow %>
								</p>
							</div>
						</div>
						<div id="commentRegisterButton">
							<div id="commentSecretCheckBox">
								<input type="checkbox" name="commentSecretCheck"
									id="commentSecretCheck"> <label
									for="commentSecretCheck">비밀댓글</label>
							</div>
							<input type="button" value="등록" id="commentRegister">
						</div>
					</div>
					<div id="commentContentBox">
						<textarea class="comment" cols="30" rows="10" id="commentContent"
							placeholder="에브리댕이 더 따뜻해질 수 있는 댓글을 달아주세요."></textarea>
					</div>
				</div>
				<%
			} else {
				%>
				<div id="contentWriteArea"></div>
				<%
			}
			%>
				<%
					List<CommentVO> cList = (List<CommentVO>) request.getAttribute("selectComment"); 
					%>
				<div id="commentAreaBox">
					<div id="commentAreaHeader">
						<p id="countComment">
							<%=cList.size() %>
						</p>
						<p id="countCommentForm">개의 댓글</p>
					</div>
					<% 
					if (cList !=null || cList.size() !=0) { 
						for (int i=0; i < cList.size(); i++){ 
							CommentVO cVo=cList.get(i);
					%>
					<div class="commentAreaBody">
						<div class="commentArea" idx=<%=cVo.getCm_no() %>>
							<div class="commentWriterInfo">
							<%
							if (vo.getMm_profile() == null || vo.getMm_profile().equals("filepath")) {
								%>
								<img
									src="<%=request.getContextPath() %>/image/user-profile/icon-user-noimage.jpg">
								<%
							} else {
								%>
								<img
									src="<%=request.getContextPath() %>/images/<%=vo.getMm_profile() %>">
								<%
							}
							%>
								<div class="commentWriterDate">
								<%
								if (cVo.getMm_nickname() == null) {
									%>
									<p class="commentWriter">(정보가 존재하지 않는 회원입니다.)</p>
									<%
								} else {
									%>
									<a href="#" class="commentWriter"><%=cVo.getMm_nickname() %></a>
									<%
								}
								%>
									<p class="commentDate"><%=cVo.getCm_date() %></p>
								</div>
							</div>
							<div class="commentContentBody" idx="<%=cVo.getCm_no() %>">
								<p class="commentContent"><%=cVo.getCm_content() %></p>
								<% if(memId.equals(cVo.getMm_id())) { %>
								<div class="commentButtons">
									<!-- 									<input type="button" value="수정" class="commentModify on" name="commentModify" >
 -->
									<input type="button" value="삭제" class="commentDelete on"
										name="commentDelete">
								</div>
								<%} else { %>
								<div class="commentButtons"></div>
								<% } %>
							</div>
						</div>
					</div>
					<%
						}}
						%>
				</div>
			</div>
		</div>
	</div>
	<footer id="footer"></footer>
	<script>
	
		$(function() {
			$("#footer").load("<%=request.getContextPath() %>/footer.jsp");
			
			nowId = "<%=memId %>";
			writer = "<%=vo.getMm_id() %>";
			if(nowId == writer) {
				$("#postModify").addClass("on");
				$("#postDelete").addClass("on");
			}
			<%
			Map<String, Object> map = new HashMap<>();
			map.put("mm_id", memId);
			map.put("ps_no", vo.getPs_no());
			%>
			console.log("<%=map%>");
			isLikeOn = "<%=pService.selectLikeOn(map) %>";
			isScrapOn = "<%=pService.selectScrapOn(map) %>";
			if (isLikeOn == 1) {
				$("#like").addClass("active");
			} else {
				$("#like").removeClass("active");
			}
			if(isScrapOn == 1) {
				$("#scrap").addClass("active");
			} else {
				$("#scrap").removeClass("active");
			}
		});
		
		$(document).on("click", ".commentDelete", function() {
			cm_no = $(".commentArea").attr("idx");
			ps_no = "<%=vo.getPs_no() %>";
			console.log(ps_no);
 			location.href = `<%=request.getContextPath() %>/commentDelete.do?cm_no=\${cm_no}&ps_no=\${ps_no}`;
		})
		
		<%-- $(document).on("click", ".reply", function() {
			replyCode = `
				<div class="replyAreaBox">
				<div class="replyWriteArea">
					<div class="replyWriterInfoBox">
						<div class="replyWriterInfo">
							<img src="<%=request.getContextPath() %>/image/user-profile/icon-user-noimage.jpg"
								alt="icon-user-profile1.png">
							<div class="replyWriterDate">
								<a href="#" class="replyWriter"><%=memId%></a>
								<p class="replyDate">
								<%=formatedNow %>
								</p>
							</div>
						</div>
						<div class="replyRegisterButton">
							<div class="replySecretCheckBox">
								<input type="checkbox" name="replySecretCheck" class="replySecretCheck">
								<label for="replySecretCheck">비밀댓글</label>
							</div>
							<input type="button" value="등록" class="replyRegister" name="replyRegister">
						</div>
					</div>
					<div class="replyContentBox">
						<textarea name="comment" class="comment" cols="30" rows="10"
							placeholder="에브리댕이 더 따뜻해질 수 있는 댓글을 달아주세요."></textarea>
					</div>
				</div>
			</div>
			`;
 			$(this).parents(".commentArea").append(replyCode);
		}); --%>
		
		<%-- $(document).on("click", ".replyRegister", function() {
			mm_id = $(this).parents(".replyWriterInfoBox").find(".replyWriter").text().trim();
			cm_date = $(this).parents(".replyWriterInfoBox").find(".replyDate").text().trim();
			cm_content = $(this).parents(".replyWriteArea").find("textarea").val();
			cm_reno = $(this).parents(".commentArea").find(".commentContentBody").attr("idx");
			ps_no = <%=vo.getPs_no()%>
			
			inputData = {
					"mm_id": mm_id,
					"cm_date": cm_date,
					"cm_content": cm_content,
					"cm_reno": cm_reno,
					"ps_no": ps_no
			}
			
			$.ajax({
				url: "<%=request.getContextPath() %>/replyRegister.do",
				data: inputData,
				type: 'post',
				success: function(res) {
					$.ajax({
						url: "<%=request.getContextPath() %>/replySelect.do",
						data: { "cm_reno": cm_reno },
						type: 'post',
						success: function(res) {
							console.log(res);
							
						},
						error: function(xhr, status) {
							console.log(xhr, status);
						},
						dataType: 'json'
					});
				},
				error: function(xhr, status) {
					console.log(xhr, status);
				},
				dataType: 'json'
			})
			
		}); --%>
		
		
		$("#commentRegister").on("click", function() {
			ps_no = "<%=vo.getPs_no() %>";
			inputData = {
					"mm_id": "<%=nowMember.getMm_id() %>",
					"ps_no": ps_no,
					"cm_content": $("#commentContent").val(),
			}
			
			$.ajax({
				url: "<%=request.getContextPath() %>/commentRegister.do",
				type: 'post',
				data: inputData,
				success: function(res) {
					$.ajax({
						url: "<%=request.getContextPath() %>/commentSelect.do",
						type: 'post',
						data: {"ps_no": ps_no},
						success: function(res) {
							console.log(res);
							$(".commentAreaBody").remove();
			                var code = '';
			                $.each(res, function(i, v) {
			                    code += '<div class="commentAreaBody">';
			                    	code += '<div class="commentArea" idx="' + v.cm_no + '">';
			                    		code += '<div class="commentWriterInfo">';
			                    			code += '<img src="<%=request.getContextPath() %>/image/user-profile/icon-user-noimage.jpg">';
			                    			code += '<div class="commentWriterDate">';
			                    				code += '<a href="#" class="commentWriter" id="">' + v.mm_nickname + '</a>';
			                    				code += '<p class="commentDate">' + v.cm_date + '</p>';
			                    			code += '</div>';
			                    		code += '</div>';
			                    		code += '<div class="commentContentBody" idx="' + v.cm_no + '">';
			                    			code += '<p class="commentContent">' + v.cm_content + '</p>';
			                    			code += '<div class="commentButtons">';
			                    				code += '<input type="button" value="삭제" class="commentDelete on" name="commentDelete">';
			                    			code += '</div>';									
			                    		code += '</div>';
			                    	code += '</div>';
			                    code += '</div>';
			                });
							$("textarea").val("");
							$("#commentAreaBox").append(code);
						},
						error: function(xhr, status) {
							console.log(xhr, status);
						},
						dataType: 'json'
					});
				},
				error: function(xhr, status) {
					console.log(xhr, status);
				},
				dataType: 'json'
			});
			
		});
		
		
		
		$(document).on("click", "#scrap", function () {
			if ("<%=memId%>" == "guest") {
				alert("로그인 후 이용해주세요.");
			} else {
				if ($("#scrap").hasClass("active")) { // #like: 좋아요 버튼
					isActive = ($("#scrap").hasClass("active"));
					$("#scrap").removeClass("active");
					$.ajax({
						url : "<%=request.getContextPath()%>/postScrapUpdate.do",
						data : {
							"ps_no" : "<%=vo.getPs_no()%>",
							"mm_id" : "<%=memId%>",
							"isActive" : isActive
						},
						type : 'get',
						success : function(res) {
							console.log(res);
						},
						error : function(xhr, status) {
							console.log(xhr);
							console.log(status);
						},
						dataType : 'json'
					});
					return false;
				} else {
					isActive = ($("#scrap").hasClass("active"));
					$("#scrap").addClass("active");
					$.ajax({
						url : "<%=request.getContextPath()%>/postScrapUpdate.do",
						data : {
							"ps_no" : "<%=vo.getPs_no()%>",
							"mm_id" : "<%=memId%>",
							"isActive" : isActive
						},
						type : 'get',
						success : function(res) {
							console.log(res);
						},
						error : function(xhr, status) {
							console.log(xhr);
							console.log(status);
						},
						dataType : 'json'
					});
					return true;
				}
			}
		});
		
		$(document).on("click", "#like", function() {
			if ("<%=memId%>" == "guest") {
				alert("로그인 후 이용해주세요.");
			} else {
			ps_no = "<%=vo.getPs_no()%>";
			if ($("#like").hasClass("active")) { // #like: 좋아요 버튼
				isActive = ($("#like").hasClass("active"));
				$("#like").removeClass("active");
				likeCount = parseInt($("#likeCount").html());
				likeCount = $("#likeCount").html(likeCount - 1);
				$.ajax({
					url : "<%=request.getContextPath()%>/postLikeUpdate.do",
					data : {
						"ps_no" : "<%=vo.getPs_no()%>",
						"mm_id" : "<%=memId%>",
						"isActive" : isActive
					},
					type : 'get',
					success : function(res) {
					},
					error : function(xhr, status) {
						console.log(xhr);
						console.log(status);
					},
					dataType : 'json'
				});
				return false;
			} else {
				isActive = ($("#like").hasClass("active"));
				$("#like").addClass("active");
				likeCount = parseInt($("#likeCount").html());
				likeCount = $("#likeCount").html(likeCount + 1);
				$.ajax({
					url : "<%=request.getContextPath()%>/postLikeUpdate.do",
					data : {
						"ps_no" : "<%=vo.getPs_no()%>",
						"mm_id" : "<%=memId%>",
						"isActive" : isActive
					},
					type : 'get',
					success : function(res) {
					},
					error : function(xhr, status) {
						console.log(xhr);
						console.log(status);
					},
					dataType : 'json'
				});
				return true;
			}
			}
			
		});

		$("#postModify").on("click", function() {
			location.href = "<%=request.getContextPath()%>/postModifing.do?no=<%=vo.getPs_no()%>&board=<%=vo.getBr_code()%>"
		});

		$("#postDelete").on("click", function() {
			vdelete = confirm("해당 글을 삭제하시겠습니까?");
            if (vdelete == true) {
	        	location.href = "<%=request.getContextPath()%>/postDelete.do?no=<%=vo.getPs_no()%>&id=<%=vo.getMm_id()%>&board=<%=vo.getBr_code()%>";
			}
		})
	</script>
</body>

</html>