package com.everydang.search.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.everydang.search.service.ISearchPostService;
import com.everydang.search.service.SearchPostService;
import com.everydang.vo.ProductVO;

@WebServlet("/searchProdDetail.do")
public class SearchProdDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String keyword = request.getParameter("keyword");

		ISearchPostService service = SearchPostService.getInstance();
		
		List<ProductVO> prodList = service.SearchProdList(keyword);
		
		request.setAttribute("SearchProdList", prodList);
		request.setAttribute("SearchKeyword", keyword);
		
		request.getRequestDispatcher("/sub/searchResult/searchProdDetail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
