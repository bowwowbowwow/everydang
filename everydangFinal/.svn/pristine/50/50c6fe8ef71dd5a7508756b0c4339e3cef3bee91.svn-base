package com.everydang.everything.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.everydang.everything.service.EverythingService;
import com.everydang.vo.OptionVO;
import com.everydang.vo.ProductVO;


@WebServlet("/selectAllProduct.do")
public class SelectAllProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		EverythingService service = EverythingService.getInstance();
		List<ProductVO> list = service.selectAllProduct();
		
		System.out.println("========================" + list + "=============================");
		System.out.println("========================" + list.size() + "=============================");
		request.setAttribute("allList", list);
		request.getRequestDispatcher("/sub/everything/everythingMain.jsp").forward(request, response);
	}
}
