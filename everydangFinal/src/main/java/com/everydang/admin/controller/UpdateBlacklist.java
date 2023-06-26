package com.everydang.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.everydang.admin.service.AdminService;
import com.everydang.admin.service.IAdminService;

/**
 * Servlet implementation class UpdateBlacklist
 */
@WebServlet("/updateBlacklist.do")
public class UpdateBlacklist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBlacklist() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String reportNo = (String) request.getParameter("reportNo");
		
		IAdminService service = AdminService.getInstance();
		
		int res = service.updateBlacklist(reportNo);
		
		System.out.println(res);
		
		request.setAttribute("result", res);
		
		request.getRequestDispatcher("/sub/admin/result.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
