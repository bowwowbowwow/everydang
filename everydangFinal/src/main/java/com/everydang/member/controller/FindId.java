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
import com.everydang.vo.MemberVO;

@WebServlet("/findId.do")
public class FindId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String mmName = request.getParameter("mm_name");
		String mmMail = request.getParameter("mm_mail");
		Map<String, String> map = new HashMap<>();
		map.put("mm_name", mmName);
		map.put("mm_mail", mmMail);
		
		IMemberService service = MemberService.getInstance();
		
		MemberVO res = service.selectFindId(map);
		
		request.setAttribute("save", res);
		
		if(res != null) {
			request.getRequestDispatcher("/sub/member/login/findIdSuccessPage.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/sub/member/login/findId.jsp").forward(request, response);		
		}
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
