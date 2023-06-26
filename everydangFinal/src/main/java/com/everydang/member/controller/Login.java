package com.everydang.member.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.everydang.member.service.IMemberService;
import com.everydang.member.service.MemberService;
import com.everydang.vo.MemberVO;


@WebServlet("/login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(); 
		IMemberService service = MemberService.getInstance();

		
		String memid = request.getParameter("mm_id");
		String mempassword = request.getParameter("mm_password");
		System.out.println(memid);
		System.out.println(mempassword);

		String grade = service.selectLogin(memid, mempassword);
		
		
		if(grade != null) {
			//String id = "로그인에 성공하셨습니다!";
			//request.setAttribute("id", id);
			if (session.getAttribute("Id").equals("guest") && session.getAttribute("grNo").equals("9")) {
				session.setAttribute("Id", memid); //myPage - myPagePost 아이디 찍힘
				session.setAttribute("grNo", grade); //header.jsp - 등급번호 찍힘 0,1,2
			}
			System.out.println(session.getAttribute("Id"));
			request.getRequestDispatcher("/index.do").forward(request, response);
			//System.out.println("++++++++++++++++++++++++" + memid); 아이디 잘 찍힘
		} else {
			//String id = "로그인에 실패하셨습니다. 아이디와 비밀번호를 확인해주세요.";
			//request.setAttribute("id", id);
			request.getRequestDispatcher("/sub/member/login/logIn.jsp").forward(request, response);		
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
