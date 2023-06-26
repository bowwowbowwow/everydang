package com.everydang.post.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.everydang.post.service.BoardService;
import com.everydang.post.service.IBoardService;
import com.everydang.vo.BoardVO;

import oracle.jdbc.proxy._Proxy_;

@WebServlet("/noticeList.do")
public class NoticeList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		IBoardService service = BoardService.getInstance();
		List<BoardVO> noticeList = service.selectAllNotice();
		request.setAttribute("noticeList", noticeList);
		request.getRequestDispatcher("/sub/board/noticeBoard.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
