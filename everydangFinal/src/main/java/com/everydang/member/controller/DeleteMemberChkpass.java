package com.everydang.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.everydang.member.service.IMemberService;
import com.everydang.member.service.MemberService;
import com.everydang.vo.MemberVO;

/**
 * Servlet implementation class DeleteMemberChkpass
 */
@WebServlet("/deleteMemberChkpass.do")
public class DeleteMemberChkpass extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		String mm_id = (String) request.getParameter("Id");
		IMemberService service = MemberService.getInstance();
		
		// 회원의 정보
		MemberVO memberVo = service.selectMemberInfo(mm_id);
		
		request.setAttribute("selectMemberInfo", memberVo);
		
		request.getRequestDispatcher("/sub/member/myPage/myPageDelete.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
