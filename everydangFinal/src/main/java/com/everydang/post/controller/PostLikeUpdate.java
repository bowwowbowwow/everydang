package com.everydang.post.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.everydang.post.service.IPostService;
import com.everydang.post.service.PostService;
import com.everydang.vo.PostVO;
import com.google.gson.Gson;

@WebServlet("/postLikeUpdate.do")
public class PostLikeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PostVO vo = new PostVO();
		boolean isActive = Boolean.parseBoolean(request.getParameter("isActive"));
		vo.setPs_no(Integer.parseInt(request.getParameter("ps_no")));
		vo.setMm_id(request.getParameter("mm_id"));

		IPostService service = PostService.getInstance();
		int count = 0;
		if (isActive == true) {
			count = service.deleteLikeInfo(vo); 
		} else {
			count = service.insertLikeInfo(vo);
		}
		Gson gson = new Gson();
		String result = null;
		if (count > 0) {
			result = "success";
		} else {
			result = "fail";
		}
		response.getWriter().write(gson.toJson(result));
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
