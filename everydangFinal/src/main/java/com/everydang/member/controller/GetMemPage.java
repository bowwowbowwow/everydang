package com.everydang.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.everydang.member.service.MemberService;
import com.everydang.vo.PostVO;
import com.google.gson.Gson;

/**
 * Servlet implementation class GetMemPage
 */
@WebServlet("/getMemPage.do")
public class GetMemPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String memId = (String) request.getParameter("Id");
		System.out.println(memId);
		// mmId로 사용자가 쓴 글 찾아오기 / profile
		MemberService service = MemberService.getInstance();

		List<PostVO> postList = service.selectAllPostById(memId);
		request.setAttribute("postList", postList);
		
		request.getRequestDispatcher("/sub/member/memberPage/memberPage.jsp").forward(request, response);

//		
//		// Gson 객체 생성
//	    Gson gson = new Gson();
//	    
//	    // 응답 데이터를 JSON 형식으로 변환
//	    String jsonResponse = gson.toJson(postList);
//	    System.out.println(jsonResponse);
//	    
//	    // 응답 데이터 전송
//	    response.setContentType("application/json");
//	    response.setCharacterEncoding("utf-8");
//	    response.getWriter().write(jsonResponse);
//		response.flushBuffer();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
