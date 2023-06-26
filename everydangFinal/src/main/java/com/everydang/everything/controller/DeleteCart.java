package com.everydang.everything.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.everydang.everything.service.EverythingService;
import com.everydang.everything.service.IEverythingService;
import com.everydang.everything.service.IWishService;
import com.everydang.everything.service.WishService;
import com.google.gson.Gson;

/**
 * Servlet implementation class DeleteCart
 */
@WebServlet("/deleteCart.do")
public class DeleteCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteCart() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String prCode = request.getParameter("pr_code");
		String crSelop = request.getParameter("cr_selop");
		
		IEverythingService service = EverythingService.getInstance();
		int res = service.deleteCartItem(prCode, crSelop);
		
		Gson gson = new Gson();
		String result= "";
		if(res > 0) result = "success";
		else result = "fail";
		
		response.getWriter().write(gson.toJson(result));
		response.flushBuffer();
	}

}
