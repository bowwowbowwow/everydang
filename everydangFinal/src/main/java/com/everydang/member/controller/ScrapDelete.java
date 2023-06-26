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

@WebServlet("/scrapDelete.do")
public class ScrapDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		
		String psno = request.getParameter("ps_no");
		
		IMemberService service = MemberService.getInstance();
		
		int count = service.deleteScrap(psno);
		
		Gson gson = new Gson();
		String result = null;
		if (count > 0) {
			result = "성공";
		} else {
			result = "실패";
		}
		response.getWriter().write(gson.toJson(result));
		response.flushBuffer();
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
