package com.everydang.post.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.everydang.post.service.CommentService;
import com.everydang.post.service.ICommentService;
import com.everydang.vo.CommentVO;
import com.google.gson.Gson;

@WebServlet("/commentRegister.do")
public class CommentRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommentVO vo = new CommentVO();
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ICommentService service = CommentService.getInstance();
		int count = service.insertNewComment(vo);
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

}
