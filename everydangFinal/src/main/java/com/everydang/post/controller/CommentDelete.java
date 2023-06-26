package com.everydang.post.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.everydang.post.dao.ICommentDAO;
import com.everydang.post.service.CommentService;
import com.everydang.post.service.ICommentService;

@WebServlet("/commentDelete.do")
public class CommentDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cm_no = request.getParameter("cm_no");
		int ps_no = Integer.parseInt(request.getParameter("ps_no"));
		ICommentService service = CommentService.getInstance();
		service.deleteComment(cm_no);
		response.sendRedirect(request.getContextPath() + "/postRead.do?board=bowwow&no=" + ps_no);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
