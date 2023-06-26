package com.everydang.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.everydang.member.service.IMemberService;
import com.everydang.member.service.MemberService;

@WebServlet("/selectMemberPostCount.do")
public class SelectMemberPostCount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String[] tableNames = {"post", "`COMMENT`", "scrap"};
		String mm_id = (String) request.getParameter("mm_id");
		Map<String, String> parameter = new HashMap<>();
		parameter.put("mm_id", mm_id);
		IMemberService service = MemberService.getInstance();
		int cnts[] = new int[tableNames.length];
		
		for(int i = 0; i < tableNames.length; i++) {
			parameter.put("tableName", tableNames[i]);
			
			cnts[i] = service.selectMemberPostCount(parameter);
		}
		request.setAttribute("counts", cnts);
		
		request.getRequestDispatcher("/sub/member/myPage/myPageMain.jsp").forward(request, response);
		
		
	}

}
