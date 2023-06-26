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
 * Servlet implementation class DeleteComment
 */
@WebServlet("/deleteComment.do")
public class DeleteComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteComment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 IAdminService service = AdminService.getInstance();
			
		String[] checkedPost = request.getParameterValues("checkedPost");

		int res = 0;

		for (String cm_no : checkedPost) {
			System.out.println("cm_no = " + cm_no);
			res = service.deleteComment(cm_no);
			System.out.println("res = " + res);
		}
		
		request.setAttribute("result", res);
		
		request.getRequestDispatcher("/sub/admin/result.jsp").forward(request, response);
	}

}
