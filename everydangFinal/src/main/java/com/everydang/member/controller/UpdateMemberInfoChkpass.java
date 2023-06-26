package com.everydang.member.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.everydang.member.service.IMemberService;
import com.everydang.member.service.MemberService;
import com.everydang.vo.MemberVO;

@WebServlet("/updateMemberInfoChkpass.do")
public class UpdateMemberInfoChkpass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String mm_id = (String) request.getParameter("Id");
		IMemberService service = MemberService.getInstance();
		
		// 회원의 정보
		MemberVO memberVo = service.selectMemberInfo(mm_id);
		
		request.setAttribute("selectMemberInfo", memberVo);
		
		request.getRequestDispatcher("/sub/member/myPage/myPageUpdate.jsp").forward(request, response);
	}

}
