package com.everydang.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.everydang.member.service.IMemberService;
import com.everydang.member.service.MemberService;
import com.google.gson.Gson;

@WebServlet("/deleteMemberInfo.do")
public class DeleteMemberInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		IMemberService service = MemberService.getInstance();
		String mm_id = (String) request.getParameter("Id");
		
		System.out.println();
		
		int res = service.deleteMemberInfo(mm_id);
		System.out.println(res);
		
		Gson gson = new Gson();
		String result = null;
		if (res > 0) {
			System.out.println(res);
			result = "SUCCESS";
		} else {
			System.out.println(res);
			result = "FAIL";
		}
		response.getWriter().write(gson.toJson(result));
		response.flushBuffer();
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
