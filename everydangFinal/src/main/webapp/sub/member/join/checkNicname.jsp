<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String res = (String)request.getAttribute("save");
if(res == null) {	// 사용 가능
%>	
	{
		"check" : "사용 가능한 닉네임입니다."
	}
	
<%} else {	 // 사용 불가 (중복)
%>	
	{
		"check" : "사용 불가능한 닉네임입니다."
	}
<%	
}
%>