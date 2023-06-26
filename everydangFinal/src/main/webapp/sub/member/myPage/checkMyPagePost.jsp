<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="com.everydang.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    
List<MemberVO>  list = (List<MemberVO>) request.getAttribute("myPostList");
JsonObject obj = new JsonObject();

Gson gson = new Gson();

JsonElement ele = gson.toJsonTree(list);

obj.add("list", ele);
out.print(obj);
out.flush();

%>
