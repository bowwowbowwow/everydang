
<%@page import="com.everydang.vo.MyScrapVO"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    
List<MyScrapVO>  list = (List<MyScrapVO>) request.getAttribute("myScrapList");
int listSize = (int) request.getAttribute("listSize");

JsonObject obj = new JsonObject();
obj.addProperty("cnt", listSize);

Gson gson = new Gson();

JsonElement ele = gson.toJsonTree(list);

obj.add("list", ele);
out.print(obj);
out.flush();

%>