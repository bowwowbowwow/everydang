package com.everydang.member.controller;

import java.io.IOException;
import java.util.List;

import javax.mail.Session;
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

import oracle.net.aso.e;

@WebServlet("/myCommentDelete.do")
public class MyCommentDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String cm_no = request.getParameter("no");
		IMemberService service = MemberService.getInstance();
		int count = service.deleteMyComment(cm_no);
		Gson gson = new Gson();
		String result = null;
		try {
			if (count > 0) {
				result = "success";
			} else {
				result = "error";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.getWriter().write(gson.toJson(result));
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
