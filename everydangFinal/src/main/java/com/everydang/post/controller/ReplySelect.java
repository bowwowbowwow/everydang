package com.everydang.post.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.everydang.post.service.CommentService;
import com.everydang.post.service.ICommentService;
import com.everydang.vo.CommentVO;
import com.google.gson.Gson;

@WebServlet("/replySelect.do")
public class ReplySelect extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/sub/board/bowwowRead.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		String cm_reno = request.getParameter("cm_reno");
		ICommentService service = CommentService.getInstance();
		List<CommentVO> allReplys = service.selectAllReply(cm_reno);
		Gson gson = new Gson();
		String result = gson.toJson(allReplys);
		response.getWriter().write(result);
		response.flushBuffer();
	}

}
