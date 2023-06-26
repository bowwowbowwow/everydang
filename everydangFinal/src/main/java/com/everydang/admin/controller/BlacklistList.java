package com.everydang.admin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.everydang.admin.service.AdminService;
import com.everydang.admin.service.IAdminService;
import com.everydang.vo.AdminVO;
import com.everydang.vo.PageVO;

/**
 * Servlet implementation class BlacklistList
 */
@WebServlet("/blacklistList.do")
public class BlacklistList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlacklistList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int page = 1;
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		IAdminService service = AdminService.getInstance();
		PageVO vo = service.getBlacklistInfo(page);
		
		Map<String, Object> map = new HashMap<>();
		map.put("start", vo.getStart());
		map.put("end", vo.getEnd());

		List<AdminVO> list = service.selectAllBlacklist(map);
		
		request.setAttribute("saveList", list);
		request.setAttribute("savePageVO", vo);
		request.setAttribute("currentPage", page);
		
		int blacklistTotalCount = service.selectBlacklistTotalCount();
		request.setAttribute("blacklistTotalCount", blacklistTotalCount);
		
		request.getRequestDispatcher("/sub/admin/blacklist.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
