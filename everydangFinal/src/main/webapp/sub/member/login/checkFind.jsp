<%@page import="com.everydang.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    
   MemberVO res = (MemberVO) request.getAttribute("save");
  
   if(res!= null){
%>
	{
	
		"flag" : "찾기 성공!" ,
	
	}
	
 <%
  }else{
%>	  
	 {
	
		"flag" : "찾기 실패!"
	
	}
	
<%	  
  }
%>
	
