package com.everydang.everything.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CartToPay
 */
@WebServlet("/cartToPay.do")
public class CartToPay extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String memId = (String) session.getAttribute("memId"); // 아이디 
		// 옵션 갯수로 넘김 
		String[] crSelopValueStrings = request.getParameterValues("selectOption");// 선택 옵션 
		String[] counts = request.getParameterValues("count"); // 수량 
		System.out.println("crSelopValueStrings:    " + Arrays.toString(crSelopValueStrings));
		System.out.println("counts:    " + Arrays.toString(counts));
		
//		for(int i=0; i < crSelopValueStrings.length; i++) {
//			//상품코드, 아이디(v), 결제방법, 날짜(sysdate), 옵션(v), 수량(V), 배송비(3000), 총액 , 주문상태 (주문 완료)
//			
//			
//			
//			
//			
//		}
		
		
		
		request.getRequestDispatcher("/sub/everything/everythingPay.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
