package com.everydang.everything.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.everydang.everything.service.IWishService;
import com.everydang.everything.service.WishService;
import com.google.gson.Gson;

/**
 * Servlet implementation class DeleteWish
 */
@WebServlet("/deleteWish.do")
public class DeleteWish extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteWish() {
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
		request.setCharacterEncoding("utf-8");
		String mmId = request.getParameter("memId");
		String prCode = request.getParameter("prCode");
		
		IWishService service = WishService.getInstance();
		int res = service.deleteWish(mmId,prCode);
		
		Gson gson = new Gson();
		String result = "";
		if(res>0) result = "success";
		else result = "fail";
		
		response.getWriter().write(gson.toJson(result));
		response.flushBuffer();
	}

}
