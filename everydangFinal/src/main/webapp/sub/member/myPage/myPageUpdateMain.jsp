<%@page import="com.everydang.member.service.MemberService"%>
<%@page import="com.everydang.member.service.IMemberService"%>
<%@page import="com.everydang.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>myPageMain</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/myPage/myPageUpdateMain.css">
    <script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
</head>
<body>
<%@ include file="/header.jsp" %>
<%
	String grade = null;
IMemberService mService = MemberService.getInstance();
MemberVO vo = mService.selectMemberInfo(memId);
	
	if(vo.getGr_no().equals("0")){
		grade = "준";
	}else {
		grade = "정";
	}
%>
    <div id="wrap">
        <div id="myProfile">
            <div id="profileDetail">
                <%
            if(vo.getMm_profile() == null) {
            	%>
                <img src="<%=request.getContextPath()%>/image/user-profile/icon-user-noimage.jpg" alt="icon-user-noimage.jpg">
            	<%
            } else {
            	%>
                <img src="<%=request.getContextPath()%>/images/<%=vo.getMm_profile() %>" alt="<%=vo.getMm_profile() %>">
            	<%
            }
            %> 
                <span id="level"><%= grade %></span>
                <span id="nickName"><%= vo.getMm_nickname() %></span>
            </div>
        </div>
        <div id="container">
            <nav id="menu">
                <h3 class="menuTitle">마이페이지</h3>
                <ul id="mypage">
                    <li><a href="<%=request.getContextPath()%>/sub/member/myPage/myPageUpdate.jsp" class="active">회원정보 확인/수정</a></li>
                </ul>
                <h3 class="menuTitle">내 활동</h3>
                <ul id="myactivity">
                    <li><a href="<%=request.getContextPath()%>/myPost.do?id=<%=memId%>">my 글</a></li>
                    <li><a href="<%=request.getContextPath()%>/myComment.do?id=<%=memId%>">my 댓글</a></li>
                    <li><a href="<%=request.getContextPath()%>/myScrap.do?id=<%=memId%>">스크랩</a></li>
                </ul>
                <h3 class="menuTitle">내 쇼핑</h3>
                <ul id="myactivity">
                    <li><a href="<%=request.getContextPath()%>/sub/member/myPage/myPageOrder.jsp">my 주문</a></li>
                    <li><a href="<%=request.getContextPath()%>/sub/member/myPage/myPageReview.jsp">my 리뷰</a></li>
                </ul>
                <a href="<%=request.getContextPath()%>/sub/faq/faq.jsp">
                    <i>
                        <img src="<%=request.getContextPath()%>/image/icon/icon-question.png" alt="question"> <span>자주 묻는 질문</span>
                    </i>
                </a>
                <a href="<%=request.getContextPath()%>/logout.do">
                    <i>
                        <img src="<%=request.getContextPath()%>/image/icon/icon-logout.png" alt="logout"> <span>로그아웃</span>
                    </i>
                </a>
            </nav>


            <div class="updatemain">
                <p class="txt">회원 정보 확인/수정</p>
                </br></br>

                <form id="memModifyInfo" enctype="multipart/form-data">
                <div>
                    <label for="profilemodify">
                    <div id="profilemodify">
                    	<img src="<%=request.getContextPath()%>/image/user-profile/icon-user-noimage.jpg" class="profile">
                        <%-- <%
                        	if(vo.getMm_profile().equals("noimage.png")){
                        %>
                        	<img src="<%=request.getContextPath()%>/images/noimage.png" class="profile">	
                        <%	}else {
                        %>
                        	<img src="<%=request.getContextPath()%>/images/<%=vo.getMm_profile()%>" class="profile">
                        <%
                        	}
                        %> --%>
                        <div id="profilemodifyicon">
                            <img src="<%=request.getContextPath()%>/image/icon/icon-profile-modify.png">
                        </div>
                        <input type="file" name="userProfile" id="fileInput">
                    </div>
                </label>
                </div>
                    </br>

                    <p class="updatemaintxt">이름</p>    
                    <input type="text" class="name" value="<%=vo.getMm_name()%>" name="mm_name">
                    <br> <br><br>

                    <p class="updatemaintxt">닉네임</p>    
                    <input type="text" class="nickname" value="<%=vo.getMm_nickname()%>">
                    <br> <br>
                    <br>
                    <p class="updatemaintxt">비밀번호 변경</p>    
                    <input type="password" class="password" placeholder="현재 비밀번호 입력" id="user-pass"><br>
                    <input type="password" class="password" placeholder="새로운 비밀번호 입력" name ="mm_password" id="mm_password"><br>
                    <input type="password" class="password" placeholder="새로운 비밀번호 확인"><br>
                    <br> <br>

					<div class="telmailbox">
						<div class="telbox">
		                    <p class="updatemaintxt">휴대폰 번호</p>    
		                    <input type="text" class="tel" value="<%=vo.getMm_tel()%>" name="mm_tel">
	                    </div>
	                    
	                    <div class="mailbox">
		                    <p class="updatemainmail">이메일</p> 
		                    <input type="text" class="mail" value="<%=vo.getMm_mail()%>" name="mm_mail">
	                    </div>
                    </div>
                    <br><br>
                    <br>
                    
                    <p class="updatemaintxt">주소</p>    
                    <input type="text" id="addr" value="<%=vo.getMm_zip()%>" name="mm_zip"> <button type="button" id="addrsearch">주소검색</button>
                    <br>
                    <input type="text" class="addr1" value="<%=vo.getMm_addr1()%>">
                    <br>
                    <input type="text" class="addr2" value="<%=vo.getMm_addr2()%>">
                    <br><br>
                    <input type="button" id="submit" value="확인"> <a href="<%= request.getContextPath() %>/deleteMemberChkpass.do?Id=<%=memId%>" id="delete">계정 삭제하기</a>
                </form>

            </div> 
        </div>



    </div>
    <footer id="footer"></footer>
    <script>
        // header & footer
        $("#footer").load("<%=request.getContextPath()%>/footer.jsp");
        
        // 비밀번호 확인 
        const passChk = $("#user-pass");
        const userPw = "<%= vo.getMm_password()%>";
        $("#submit").on("click",function(e){
        	let pass = passChk.val();
        	if(pass.indexOf(userPw) == -1){
        		alert("비밀번호가 일치하지 않습니다.")
        	}else {
        		<%-- $("#memModifyInfo").attr("action","<%= request.getContextPath()%>/updateMemberInfoOk.do?Id=<%=memId%>"); --%>
        		let fileInput = $("#fileInput")[0];
        		let file = fileInput.files[0];

        		const formData = new FormData();
        		formData.append("file", file); // 파일 데이터 추가
        		formData.append("mm_id", "<%= memId%>");
        		formData.append("mm_password", $("#mm_password").val());
        		formData.append("mm_name", $(".name").val());
        		formData.append("mm_nickname", $(".nickname").val());
        		formData.append("mm_mail", $(".mail").val());
        		formData.append("mm_tel", $(".tel").val());
        		formData.append("mm_zip", $("#addr").val());
        		formData.append("mm_addr1", $(".addr1").val());
        		formData.append("mm_addr2", $(".addr2").val());
        		formData.append("gr_no", "<%=vo.getGr_no()%>");
        		
        		$.ajax({
        			url : "<%= request.getContextPath()%>/updateMemberInfoOk.do",
        			method : "post",
        			data : formData,
        			processData: false,
        			contentType: false,
        			success : function(res){
        				if(res.indexOf("success")){
        					alert("변경이 완료되었습니다.")
        					location.href = "<%=request.getContextPath()%>/selectMemberInfo.do?Id="+memId;
        				}
        			},
        			error : function(xhr,error){
        				console.log(xhr, error);
        			}
        		})
        	}
        })
        
       
    </script>
</body>
</html>