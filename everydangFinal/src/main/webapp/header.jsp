<%@page import="com.everydang.vo.PostVO"%>
<%@page import="com.everydang.post.service.PostService"%>
<%@page import="com.everydang.post.service.IPostService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
	
	String memId = (String) session.getAttribute("Id");
	String grNo = (String) session.getAttribute("grNo");
	
	if(memId == null) {
		session.setAttribute("Id", "guest");
	}
 	if (grNo != null || grNo == "") {
 		session.setAttribute("grNo", grNo);
 	} else  {
 		session.setAttribute("grNo", "9");
 	}
 	
 	if(memId != null) {
 		session.setAttribute("Id", memId);
	} else {
 		session.setAttribute("Id", "guest");
	} 
	
	IPostService headerService = PostService.getInstance();
	PostVO postVO = (PostVO) headerService.selectMemberInfo(memId);
%>
        <header id="header">
        	<div class="headWrap container">
            <div class="h-left">
                <h1 class="logo"><a href="<%=request.getContextPath()%>/index.do">에브리댕</a></h1>
                <ul class="gnb">
                    <li class="list1"><a href="<%=request.getContextPath()%>/bowwowList.do">멍멍게시판</a></li>
                    <li class="list2"><a href="/everydang/sub/board/findBoard.jsp">찾습니다</a></li>
                    <li class="list3"><a href="<%=request.getContextPath() %>/selectAllProduct.do">에브리띵</a></li>
                    <li class="list4"><a href="<%=request.getContextPath()%>/noticeList.do">공지사항</a></li>
                </ul>
            </div>
            <div class="h-right">
                <div class="search-area">
                    <div class="search-box">
                        <p></p>
                        <form action="<%= request.getContextPath() %>/searchPost.do" method="get">
	                        <input type="text" id="input-search" name="keyword" placeholder="검색">
                        </form>
                    </div>
                </div>
                <div class="user-area">
                <%
                	if(memId.equals("guest")){
                %>
                    <div class="guest">   
                        <div class="user-login">
                            <a href="<%=request.getContextPath() %>/sub/member/login/logIn.jsp">
                                <i class="icon-user"></i>
                                로그인</a>
                        </div>
                        <div class="divider"></div>
                        <div class="user-join">
                            <a href="<%=request.getContextPath() %>/sub/member/join/join.jsp">회원가입</a>
                        </div>
                    </div>
               <%
                	}else{
                		if(!grNo.equals("2")){
               %>   
                    <div class="member">
                        <div class="user-cart">
                            <a href="<%=request.getContextPath() %>/sub/everything/everythingCart.jsp">
                                <i class="icon"></i>
                            </a>
                        </div>
                        <div class="user-page">
                        <%
	                        if (postVO.getMm_profile() == null) {
	                        	%>
                            <a href="<%=request.getContextPath() %>/selectMemberInfo.do?Id=<%=memId %>" class="thum">
                                <i class="icon" style="background-image: url('<%=request.getContextPath()%>/image/user-profile/icon-user-noimage.jpg');"></i>
                            </a>
	                        	<%
	                        } else {
	                        	%>
                            <a href="<%=request.getContextPath() %>/selectMemberInfo.do?Id=<%=memId %>" class="thum">
                                <i class="icon" style="background-image: url('<%=request.getContextPath()%>/image/user-profile/icon-user-noimage.jpg');"></i>
                            </a>
	                        	<%
	                        }
                        
                        %>
                        </div>
                    </div>
                <%
                	}else {
            	%>
                
                     <div class="admin">
                        <a href="<%=request.getContextPath() %>/adminMain.do">관리자 페이지</a>
                    </div>
                <% 
                  		 }
                	}
                %>
                </div>
            </div>
        </div>
        </header>
        
        <script type="text/javascript">
        	let url = window.location.href;
        	if(url.includes("everything"))document.querySelector(".user-area .member").classList.add("shop");
        	let memId = "<%=session.getAttribute("Id") %>";
			if(memId != null && <%= grNo %> != 2){
				document.querySelector(".list4").addEventListener("click",function(){
					document.querySelector(".user-area .member").classList.add("shop");
				})
			}
		</script>