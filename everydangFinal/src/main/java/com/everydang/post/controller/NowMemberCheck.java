package com.everydang.post.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.everydang.post.service.IPostService;
import com.everydang.post.service.PostService;
import com.everydang.vo.PostVO;

@WebServlet("/nowMemberCheck.do")
public class NowMemberCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		IPostService service = PostService.getInstance();
		PostVO nowMember = service.selectMemberInfo((String) session.getAttribute("memId"));
		request.setAttribute("nowMember", nowMember);
		request.getRequestDispatcher("/sub/board/bowwowRead.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
