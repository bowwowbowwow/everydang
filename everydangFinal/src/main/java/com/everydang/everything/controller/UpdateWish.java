package com.everydang.everything.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Delete;

import com.everydang.everything.service.EverythingService;
import com.everydang.everything.service.IEverythingService;
import com.everydang.everything.service.IWishService;
import com.everydang.everything.service.WishService;
import com.everydang.vo.CartVO;
import com.everydang.vo.WishVO;
import com.google.gson.Gson;

/**
 * Servlet implementation class UpdateWish
 */
@WebServlet("/updateWish.do")
public class UpdateWish extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateWish() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String memId = request.getParameter("mem_id");
		String prodCode = request.getParameter("pr_code");
		
		
		// 위시를 미리 받아오고 그 vo 가 널이면 1로 인서트를 하고 - insert  
		// 널이 아니면 널로 바꿔준다. -delete 
		IWishService service = WishService.getInstance();
		WishVO wishvo = service.selectWish(memId, prodCode);
		int res = 0;
		int wsLike = 0;
		if(wishvo == null || wishvo.getWs_like() == 0) {
			// 데이터가 없을 때 - insert  
			wishvo = new WishVO();
			wishvo.setMm_id(memId);
			wishvo.setPr_code(prodCode);
			res = service.insertWish(wishvo);
			wsLike = 0;
		} else {
			// 데이터가 있을 때 
			res = service.deleteWish(wishvo.getMm_id(),prodCode);
			wsLike = 1;
		}
		Gson gson = new Gson();
		
		if(res > 0) {wsLike = (wsLike+1)%2;}
		else {wsLike = (wsLike+1);}
		response.getWriter().write(gson.toJson(wsLike));
		response.flushBuffer();
		
//		request.setAttribute("res", res);
//		request.setAttribute("wsLike", wishvo.getWs_like());
//		System.out.println(wishvo.getWs_like());
//		request.getRequestDispatcher("/sub/everything/result.jsp").forward(request, response);
	}

}
