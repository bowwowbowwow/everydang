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

@WebServlet("/replyList.do")
public class ReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int ps_no = Integer.parseInt(request.getParameter("no"));
		ICommentService service = CommentService.getInstance();
		CommentVO commentPerPost = service.selectCommentPerPost(ps_no);
		List<CommentVO> allReplies = service.selectAllReply(commentPerPost.getCm_no());
		request.setAttribute("allReplies", allReplies);
		request.getRequestDispatcher("/sub/board/bowwowRead.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
