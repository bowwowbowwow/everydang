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

@WebServlet("/postDelete.do")
public class PostDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PostVO vo = new PostVO();
		vo.setMm_id(request.getParameter("id"));
		vo.setPs_no(Integer.parseInt(request.getParameter("no")));
		IPostService service = PostService.getInstance();
		service.deletePost(vo);
		response.sendRedirect(request.getContextPath() + "/" + request.getParameter("board") + "List.do");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
