package com.everydang.everything.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Options;

import com.everydang.everything.service.EverythingService;
import com.everydang.everything.service.IEverythingService;
import com.everydang.vo.CartVO;
import com.everydang.vo.OptionVO;

@WebServlet("/insertCart.do")
public class InsertCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public InsertCart() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String mmId = (String) request.getParameter("id");
		String prCode = request.getParameter("pr_code");
		int crCount = Integer.parseInt(request.getParameter("cr_count"));
		String crSelop = request.getParameter("cr_selop");
		
		
		// 가져온 값으로 장바구니에 저장할 요소들을 세팅 
		CartVO cartVO = new CartVO();
		
		cartVO.setMm_id(mmId);
		cartVO.setPr_code(prCode);
		cartVO.setCr_count(crCount);
		cartVO.setCr_selop(crSelop);
		
		request.setAttribute("cartVO", cartVO);
		IEverythingService service = EverythingService.getInstance();
		// 같은 옵션을 가진 상품을 사용자의 아이디를 이용해 장바구니에 있는지 
		String memId = service.checkCart(cartVO.getPr_code(), cartVO.getCr_selop());
		// 상품 이름과 옵션 이름을 사용해 장바구니 내에 해당 옵션을 가진 장바구니 품목 있는지 검사 
		CartVO cVo = service.selectCartByOption(cartVO.getPr_code(), cartVO.getCr_selop());
		System.out.println(cVo);
		
		
		if(memId != null) { // 상품이 장바구니 내에 있을 때 
			// 해당 상품과 상품페이지에서 선택한 옵션이 같은 옵션을 가지고 있으면 
			if(cVo.getCr_selop().equals(cartVO.getCr_selop())) {
				// 새로운 수량으로 update 
				service.updateCart(cartVO);
				
			}
			else { // 해당 상품은 있는데 같은 옵션이 아니면 
				// 새로 insert
				service.insertCart(cartVO);
			}			
		} else { // 장바구니 내에 아예 없으면 
			service.insertCart(cartVO);
		}
		System.out.println("===================================================================");
		request.getRequestDispatcher("/sub/everything/everythingCart.jsp").forward(request, response);
		request.setAttribute("cartVO", cartVO);
	}
}







