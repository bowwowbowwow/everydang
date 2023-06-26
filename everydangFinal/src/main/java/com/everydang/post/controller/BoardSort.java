package com.everydang.post.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.everydang.post.dao.IBoardDAO;
import com.everydang.post.service.BoardService;
import com.everydang.post.service.IBoardService;
import com.everydang.post.service.IPostService;
import com.everydang.post.service.PostService;
import com.everydang.vo.BoardVO;
import com.google.gson.Gson;

@WebServlet("/boardSort.do")
public class BoardSort extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");

		/*
		 * "mm_nickname": $(".writer").val(), "ps_date": $(".date").val(), "ps_subject":
		 * $(".subject").val(), "ps_content": $(".content").val(), "ls_like":
		 * $(".countLike").val(), "cm_no": $(".countComment").val(), "ps_no":
		 * $(".normalPost").attr('idx'), "optionValue": optionValueå
		 */

		BoardVO vo = new BoardVO();
		vo.setMm_nickname(request.getParameter("mm_nickname"));
		vo.setPs_date(request.getParameter("ps_date"));
		vo.setPs_subject(request.getParameter("ps_subject"));
		vo.setPs_content(request.getParameter("ps_content"));
		
		String likeCountString = request.getParameter("ls_like");
		int likeCount = 0;
		if (likeCountString == null || likeCountString == "") {
			likeCount = 0;
		} else {
			likeCount = Integer.parseInt(likeCountString);
		}
		vo.setLk_like(likeCount);
		
		String commentCountString = request.getParameter("ls_like");
		int commentCount = 0;
		if (commentCountString == null || commentCountString == "") {
			commentCount = 0;
		} else {
			commentCount = Integer.parseInt(commentCountString);
		}
		vo.setCm_no(commentCount);
		vo.setPs_no(Integer.parseInt(request.getParameter("ps_no")));

		IBoardService service = BoardService.getInstance();
		List<BoardVO> sortedList = null;
		String option = request.getParameter("optionValue");
		switch (option) {
		case "날짜순":
			sortedList = service.selectPostToListBoard();
			break;
		case "좋아요순":
			sortedList = service.selectPostSortedByLike();
			break;
		case "댓글순":
			sortedList = service.selectPostSortedByComment();
			break;
		}

		Gson gson = new Gson();
		String sortedListJson = gson.toJson(sortedList);
		response.getWriter().write(sortedListJson);
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
