package com.everydang.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.everydang.member.service.IMemberService;
import com.everydang.member.service.MemberService;

//아이디 중복 검사
@WebServlet("/checkId.do")
public class CheckId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CheckId() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String mm_id = request.getParameter("id");
		
		IMemberService service = MemberService.getInstance();
		
		String res = service.selectCheckId(mm_id);
		
		request.setAttribute("save", res);
		
		request.getRequestDispatcher("/sub/member/join/checkId.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
