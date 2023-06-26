<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// update, delete, insert 할 때 공통으로 씀
//서블릿에서 저장한 데이터 꺼내기 
int res = (Integer)request.getAttribute("result");

if(res > 0) { %>
{ "flag" : "완료했습니다." }
<% } else { %>
{ "flag" : "실패했습니다." }
<% } %>