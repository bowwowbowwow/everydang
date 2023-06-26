package com.everydang.everything.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.everydang.everything.service.EverythingService;
import com.everydang.everything.service.IEverythingService;
import com.everydang.everything.service.IWishService;
import com.everydang.everything.service.WishService;
import com.everydang.vo.CartVO;
import com.everydang.vo.OptionVO;
import com.everydang.vo.ProductVO;
import com.everydang.vo.WishVO;

// 상품 페이지 보기 
@WebServlet("/productOption.do")
public class ProductOption extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ProductOption() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String prCode = request.getParameter("pr_code");
		HttpSession session = request.getSession();
		
		IEverythingService service = EverythingService.getInstance();
		IWishService wishService = WishService.getInstance();
		ProductVO productvo = service.selectProduct(prCode);
		List<OptionVO> optionList = service.selectAllOption(prCode);
		List<OptionVO> fileList = service.selectAllFile(prCode);
		
		System.out.println(optionList);
		System.out.println(fileList);
		String memId = (String) session.getAttribute("Id"); 
//	   	CartVO cartVO = service.selectAllCart(memId, productvo.getPr_code());
//	   	System.out.println(cartVO);
		System.out.println(memId);
		request.setAttribute("productvo", productvo);
		request.setAttribute("optionList", optionList);
		request.setAttribute("fileList", fileList);
		request.setAttribute("pr_code", prCode);
//		request.setAttribute("cartvo", cartVO);
		
		// 위시리스트 좋아요 여부에 따라 페이지 이동 - 아이디(memId) / 상품코드(prCode) 필요
		WishVO wishvo = new WishVO();
		wishvo.setMm_id(memId);
		wishvo.setPr_code(prCode);
		wishvo = wishService.selectWish(memId, prCode);
		int wishLike = 0;
		if (wishvo == null) {
			WishVO wishvo1 = new WishVO(memId,prCode,0);
			wishLike = wishvo1.getWs_like();
			System.out.println("ddddddddddd"+wishLike);
		} else {
			wishLike = wishvo.getWs_like();
			System.out.println("DDDDD"+wishLike);
			System.out.println("ddddddddddd"+wishLike);
		}
		
		request.setAttribute("wishLike", wishLike);
		
		request.getRequestDispatcher("/sub/everything/everythingDetail.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
