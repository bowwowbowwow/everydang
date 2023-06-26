package com.everydang.admin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.everydang.admin.service.AdminService;
import com.everydang.admin.service.IAdminService;

/**
 * Servlet implementation class UpdateDefendentGrade
 */
@WebServlet("/updateDefendentGrade.do")
public class UpdateDefendentGrade extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDefendentGrade() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String reportNo = (String) request.getParameter("reportNo");
		String memId = (String) request.getParameter("memId");
		
		System.out.println(reportNo);
		System.out.println(memId);
		
		Map<String, String> map = new HashMap<>();
		map.put("rp_no", reportNo);
		map.put("mm_id", memId);
		
		System.out.println(map);
		
		IAdminService service = AdminService.getInstance();
		
		int res = service.updateDefendentGrade(map);
		
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
