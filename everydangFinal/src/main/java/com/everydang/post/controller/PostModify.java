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

@WebServlet("/postModify.do")
public class PostModify extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String boardName = request.getParameter("br_code");
		request.getRequestDispatcher("/sub/board/" + boardName + "Modify.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/ajax; charset=utf-8");
		PostVO modifyVO = new PostVO();
		try {
			BeanUtils.populate(modifyVO, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		IPostService service = PostService.getInstance();
		int count = service.updatePostInfo(modifyVO);
		Gson gson = new Gson();
		String result = null;
		if (count > 0) {
			result = "succes";
		} else {
			result = "fail";
		}
		response.getWriter().write(gson.toJson(result));
		response.flushBuffer();
	}

}
