package com.everydang.post.controller;

import java.io.IOException;
import java.util.List;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.everydang.post.dao.ICommentDAO;
import com.everydang.post.service.CommentService;
import com.everydang.post.service.ICommentService;
import com.everydang.post.service.IPostService;
import com.everydang.post.service.PostService;
import com.everydang.vo.CommentVO;
import com.everydang.vo.PostVO;

@WebServlet("/postRead.do")
public class PostRead extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int ps_no = Integer.parseInt(request.getParameter("no"));
		
		IPostService pService = PostService.getInstance();
		PostVO pVO = pService.selectPost(ps_no);
		pService.updateHit(ps_no);
		
		ICommentService cService = CommentService.getInstance();
		List<CommentVO> cVO = cService.selectAllCommentsPerPost(ps_no);
		
		request.setAttribute("selectPost", pVO);
		request.setAttribute("selectComment", cVO);
		request.getRequestDispatcher("/sub/board/" + request.getParameter("board") + "Read.jsp").forward(request,
				response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
