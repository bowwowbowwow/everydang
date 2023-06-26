package com.everydang.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.everydang.member.service.IMemberService;
import com.everydang.member.service.MemberService;
import com.everydang.vo.MemberVO;
import com.google.gson.Gson;


@WebServlet("/myPost.do")
public class MyPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IMemberService service = MemberService.getInstance();
//	    HttpSession session = request.getSession();
		
		String memid = (String) request.getParameter("id");
		
		List<MemberVO> myPostList = service.selectMyPost(memid);
		
		request.setAttribute("myPostList", myPostList);
		request.getRequestDispatcher("/sub/member/myPage/myPagePost.jsp").forward(request, response);
//		
//		
//		request.getRequestDispatcher("/sub/member/myPage/checkMyPagePost.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
