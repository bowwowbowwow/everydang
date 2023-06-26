package com.everydang.post.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.everydang.post.service.IPostService;
import com.everydang.post.service.PostService;
import com.everydang.vo.PostVO;
import com.google.gson.Gson;

@WebServlet("/postModifing.do")
public class PostModifing extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/ajax; charset=utf-8");
		int ps_no = Integer.parseInt(request.getParameter("no"));
		String boardName = request.getParameter("board");
		IPostService service = PostService.getInstance();
		PostVO modifyVO = service.selectPostInfo(ps_no);
		request.setAttribute("modifyVO", modifyVO);
		request.getRequestDispatcher("/sub/board/" + boardName + "Modify.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
