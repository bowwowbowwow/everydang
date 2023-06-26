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


@WebServlet("/adminLogin.do")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		IMemberService service = MemberService.getInstance();
				
		String mmid = request.getParameter("mm_id");
		String mmpassword = request.getParameter("mm_password");
		
		
		String vo = service.selectLogin(mmid, mmpassword);
		
				
		
		if(vo!=null && "2".equals(vo)) {
			session.setAttribute("grNo", vo);
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/sub/member/login/logInAdmin.jsp").forward(request, response);			
		}
		
		
	
	}
	
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
