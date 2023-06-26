package com.everydang.member.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.security.spec.ECGenParameterSpec;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import com.everydang.member.service.IMemberService;
import com.everydang.member.service.MemberService;
import com.everydang.vo.ReportVO;
import com.google.gson.Gson;

@WebServlet("/insertReportMember.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 50, // 50메가
		maxRequestSize = 1024 * 1024 * 50 // 50메가 5개까지
)
public class InsertReportMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reporter = (String) request.getParameter("rp_reporter");
		String defendent = (String) request.getParameter("rp_defendent");
		request.getRequestDispatcher(request.getContextPath() +
				"/insertReportMember.do?rp_reporter="+reporter+"&rp_defendent="+defendent);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		ReportVO reportvo = new ReportVO();

		String reporter = (String) request.getParameter("rp_reporter");
		String defendent = (String) request.getParameter("rp_defendent");
		String reason1 = (String) request.getParameter("declaration");
		String reason2 = (String) request.getParameter("textArea");

		System.out.println(reporter);
		System.out.println(defendent);
		System.out.println(reason1);
		System.out.println(reason2);
		reportvo.setRp_reporter(reporter);
		reportvo.setRp_defendent(defendent);
		reportvo.setRp_reason1(reason1);
		reportvo.setRp_reason2(reason2);

		// 사용자가 업로드한 파일이 저장될 서버쪽의 폴더 경로 설정
		String uploadPath = "/Users/ChoiSeoYeon/Downloads/everydangFinal/src";
		System.out.println(uploadPath);

		// 저장될 폴더가 없으면 폴더를 만들어 준다.
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdirs();
		}

		// 사용자가
		request.setCharacterEncoding("utf-8");

		// form의 file입력요소의 name값은 Part객체의 이름역할을 한다.
		// 이 이름을 이용하여 Part객체를 구한다.
		Part part = request.getPart("decFile");

		if (part != null) {
			String fileName = extractFilename(part);

			if (!"".equals(fileName)) {
				part.write(uploadPath + File.separator + fileName);

				reportvo.setRp_file(fileName); // DB에 저장할 파일명을 VO객체에 저장
			}
		}
		IMemberService service = MemberService.getInstance();

		service.insertReportMember(reportvo);
		response.sendRedirect(request.getContextPath() + "/getMemPage.do?Id=" + defendent);
	}

	// Part구조 안에서 파일명을 찾는 메서드
	private String extractFilename(Part part) {
		String fileName = "";

		String contentDisposition = part.getHeader("content-disposition");
		String[] items = contentDisposition.split(";");
		for (String item : items) {
			if (item.trim().startsWith("filename")) {
				// filename="test1.txt"
				fileName = item.substring(item.indexOf("=") + 2, item.length() - 1);
			}
		}

		return fileName;
	}

}
