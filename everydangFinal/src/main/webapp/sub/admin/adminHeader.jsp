<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%-- <%
	
 	String grNo = (String) session.getAttribute("grNo");
	if(grNo.equals("2")){
		session.setAttribute("grNo", grNo);
	}

%> --%>
	<header id="header">
		<div class="headWrap">
			 <div class="h-left">
                <h1 class="logo"><a href="/everydang/index.jsp">에브리댕</a></h1>
            </div>
            <div class="h-right">
                <a href="<%=request.getContextPath()%>/logout.do">
                	<i class="icon">로그아웃</i>
                </a>
                <div class="user-info">
                	<h3 id="admin-name">에브리댕관리자</h3>
                </div>
            </div>
		</div>
	</header>
	
