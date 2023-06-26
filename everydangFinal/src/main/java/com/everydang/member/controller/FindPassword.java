package com.everydang.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.EmailException;

import com.everydang.member.service.IMemberService;
import com.everydang.member.service.MemberService;
import com.everydang.vo.MemberVO;




@WebServlet("/findPassword.do")
public class FindPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String mmId = request.getParameter("mm_id");
		String mmMail = request.getParameter("mm_mail");
		
		Map<String, String> map = new HashMap<>();
		map.put("mm_id", mmId);
		map.put("mm_mail", mmMail);
		
		IMemberService service = MemberService.getInstance();
		
		try {
			service.selectFindPassword(map);
			
			request.setAttribute("successMessage", "이메일이 성공적으로 전송되었습니다.");
		} catch (EmailException e) {
			e.printStackTrace();
			
			request.setAttribute("errorMessage", "이메일 전송에 실패하였습니다.");
		}
		
		request.getRequestDispatcher("/sub/member/login/findPassword.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
