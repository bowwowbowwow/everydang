
<%@page import="com.everydang.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//String res = (String) session.getAttribute("adminid");
    
   MemberVO  res = (MemberVO) session.getAttribute("adminid");
   

   
   if(res != null){
%>
	{
	
		"flag" : "로그인 성공!" 

	
	}
	
 <%
  }else{
%>	  
	 {
		
		"flag" : "로그인 실패!" 
	
	}
	
<%	  
  }
%>
	
