package com.everydang.admin.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.everydang.admin.service.AdminService;
import com.everydang.admin.service.IAdminService;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;


/**
 * Servlet implementation class DeletePost
 */
@WebServlet("/deletePost.do")
public class DeletePost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletePost() {
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

		for (String ps_no : checkedPost) {
			System.out.println("ps_no = " + ps_no);
			res = service.deletePost(ps_no);
			System.out.println("res = " + res);
		}
		
		request.setAttribute("result", res);
		
		request.getRequestDispatcher("/sub/admin/result.jsp").forward(request, response);
	}

}
 