package com.everydang.member.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.everydang.member.service.IMemberService;
import com.everydang.member.service.MemberService;
import com.everydang.vo.MemberVO;
import com.google.gson.Gson;

@WebServlet("/updateMemberInfoOk.do")
@MultipartConfig
public class UpdateMemberInfoOk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		IMemberService service = MemberService.getInstance();
		MemberVO vo = new MemberVO();

		vo.setMm_id(request.getParameter("mm_id"));
		vo.setMm_name(request.getParameter("mm_name"));
		vo.setMm_nickname(request.getParameter("mm_nickname"));
		vo.setMm_password(request.getParameter("mm_password"));
		vo.setMm_mail(request.getParameter("mm_mail"));
		vo.setMm_tel(request.getParameter("mm_tel"));
		vo.setMm_zip(request.getParameter("mm_zip"));
		vo.setMm_addr1(request.getParameter("mm_addr1"));
		vo.setMm_addr2(request.getParameter("mm_addr2"));
		vo.setGr_no(request.getParameter("gr_no"));

		// 파일 및 텍스트 데이터 처리
		Part filePart = request.getPart("file");
		System.out.println(filePart);
		// 사용자가 업로드한 파일이 저장될 서버쪽의 폴더 경로 설정
		String uploadPath = request.getContextPath() + "/images";

		// 저장될 폴더가 없으면 폴더를 만들어 준다.
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdirs();
		}

		if (filePart != null) {
			String originName = extractFilename(filePart);
			String fileName = vo.getMm_id() + "_profile." + originName;

			if (!"".equals(fileName)) {
				try {
					filePart.write(uploadPath + File.separator + fileName);

					vo.setMm_profile(fileName); // DB에 저장할 파일명을 VO객체에 저장
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
		}
		int res = service.updateMemberInfo(vo);
		/* request.setAttribute("updateMemberInfoOk", res); */
		
		Gson gson = new Gson();
		String result = null;
		if (res > 0) {
			System.out.println(res);
			result = "SUCCESS";
		} else {
			System.out.println(res);
			result = "FAIL";
		}
		response.getWriter().write(gson.toJson(result));
		response.flushBuffer();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	// Part구조 안에서 파일명을 찾는 메서드
	private String extractFilename(Part part) {
		 String fileName = "";

		    // Extract the filename from the part
		    String contentDisposition = part.getHeader("content-disposition");
		    String[] elements = contentDisposition.split(";");
		    for (String element : elements) {
		        if (element.trim().startsWith("filename")) {
		            fileName = element.substring(element.indexOf('=') + 1).trim().replace("\"", "");
		            break;
		        }
		    }

		    int dotIndex = fileName.lastIndexOf(".");
		    if (dotIndex > 0 && dotIndex < fileName.length() -1) {
		        fileName = fileName.substring(dotIndex + 1).toLowerCase();
		    }

		    return fileName;
		/*
		 * String fileName = "";
		 * 
		 * int dotIndex = fileName.lastIndexOf("."); System.out.println(dotIndex); if
		 * (dotIndex > 0 && dotIndex < fileName.length() - 1) { fileName =
		 * fileName.substring(dotIndex + 1,fileName.length()).toLowerCase(); }
		 * System.out.println(fileName); return fileName;
		 */
	}

}
