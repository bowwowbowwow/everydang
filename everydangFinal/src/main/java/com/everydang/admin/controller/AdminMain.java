package com.everydang.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.everydang.admin.service.AdminService;
import com.everydang.admin.service.IAdminService;
import com.everydang.vo.AdminVO;
import com.google.gson.Gson;

/**
 * Servlet implementation class MemberTotalCount
 */
@WebServlet("/adminMain.do")
public class AdminMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMain() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		
		IAdminService service = AdminService.getInstance();
		
		int memberTotal = service.selectMemberTotalCount();
		int todayNewMember = service.selectTodayNewMemberCount();
		int todayNewReport = service.selectTodayNewReportCount();
		
		List<AdminVO> newPostList = service.selectNewPost();
		List<AdminVO> popularPostList = service.selectPopularPost();
		List<AdminVO> newMemberList = service.selectNewMember();
		
		request.setAttribute("memberTotalCount", memberTotal);
		request.setAttribute("todayJoinMember", todayNewMember);
		request.setAttribute("todayNewReport", todayNewReport);
		request.setAttribute("newPostList", newPostList);
		request.setAttribute("popularPostList", popularPostList);
		request.setAttribute("newMemberList", newMemberList);
		
		request.getRequestDispatcher("/sub/admin/adminMain.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
