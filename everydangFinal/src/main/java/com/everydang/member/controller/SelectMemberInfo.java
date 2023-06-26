package com.everydang.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.everydang.member.service.IMemberService;
import com.everydang.member.service.MemberService;
import com.everydang.vo.MemberVO;
@WebServlet("/selectMemberInfo.do")
public class SelectMemberInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String mm_id = (String) request.getParameter("Id");
		
		String[] tableNames = {"post", "\"COMMENT\"", "scrap"};
		Map<String, String> parameter = new HashMap<>();
		parameter.put("mm_id", mm_id);
		IMemberService service = MemberService.getInstance();
		
		// 글의 총 갯수
		int cnts[] = new int[tableNames.length];
		
		for(int i = 0; i < tableNames.length; i++) {
			parameter.put("tableName", tableNames[i]);			
			cnts[i] = service.selectMemberPostCount(parameter);
		}
		request.setAttribute("counts", cnts);
		
		// 회원의 정보
		MemberVO memberVo = service.selectMemberInfo(mm_id);
		
		System.out.println(memberVo);
		request.setAttribute("selectMemberInfo", memberVo);
		
		request.getRequestDispatcher("/sub/member/myPage/myPageMain.jsp").forward(request, response);
		
	}

}
