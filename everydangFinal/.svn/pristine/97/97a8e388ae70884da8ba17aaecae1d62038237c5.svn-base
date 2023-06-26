<%@page import="com.everydang.vo.PageVO"%>
<%@page import="com.everydang.vo.AdminVO"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 서블릿에서 저장한 데이터 꺼내기 
List<AdminVO> list = (List<AdminVO>)request.getAttribute("saveList");
PageVO vo = (PageVO)request.getAttribute("savePageVO");
int blacklistTotalCount = (Integer) request.getAttribute("blacklistTotalCount");

JsonObject obj = new JsonObject();
obj.addProperty("sp", vo.getStartPage() );
obj.addProperty("ep", vo.getEndPage());
obj.addProperty("tp", vo.getTotalPage());
obj.addProperty("blacklistCnt", blacklistTotalCount);

Gson gson = new Gson();

JsonElement ele = gson.toJsonTree(list);

obj.add("datas", ele);
out.print(obj);
out.flush();
%>