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
import com.everydang.vo.CommentVO;
import com.google.gson.Gson;

@WebServlet("/myComment.do")
public class MyComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
//		HttpSession session = request.getSession();
		String mm_id = request.getParameter("id");
		IMemberService service = MemberService.getInstance();
		List<CommentVO> allComments = service.selectMyComment(mm_id);
		int listSize = allComments.size();
		
		request.setAttribute("listSize", listSize);
		
		request.setAttribute("allComments", allComments);
		request.getRequestDispatcher("/sub/member/myPage/myPageReply.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
