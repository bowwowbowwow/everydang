package com.everydang.member.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import com.everydang.member.service.IMemberService;
import com.everydang.member.service.MemberService;
import com.everydang.vo.MemberVO;


@WebServlet("/joinInformation.do")
public class JoinInformation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO vo = new MemberVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
			System.out.println(vo.getMm_id());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		IMemberService service = MemberService.getInstance();
		
		int res = service.insertJoinInformation(vo);
		
		request.setAttribute("save", res);
		
		request.getRequestDispatcher("/sub/member/join/insert.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
