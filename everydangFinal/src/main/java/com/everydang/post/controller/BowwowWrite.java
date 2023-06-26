package com.everydang.post.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

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

@WebServlet("/bowwowWrite.do")
public class BowwowWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/sub/board/bowwowWrite.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PostVO vo = new PostVO();
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		IPostService service = PostService.getInstance();
		int count = service.insertPost(vo);

		Gson gson = new Gson();
		String result = null;
		if (count == 1) {
			result = gson.toJson("success");
		} else if (count == 0) {
			result = gson.toJson("fail");
		}
		response.getWriter().write(result);
		response.flushBuffer();
	}

}
