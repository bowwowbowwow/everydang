package com.everydang.admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class RegisterProd
 */
@WebServlet("/registerProd.do")
@MultipartConfig(
	       fileSizeThreshold = 1024*1024,
	       maxFileSize = 1024*1024*50, //50메가
	       maxRequestSize = 1024*1024*50 // 50메가 5개까지
	   )
public class RegisterProd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterProd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String prodCode = request.getParameter("prodCode");
		String prodName = request.getParameter("prodName");
		String prodPrice = request.getParameter("prodPrice");
		
		// 상품이미지
		String uploadPath = request.getContextPath()+"/images"; // 업로드 경로를 지정해야 합니다.

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        try {
            List<Part> fileParts = request.getParts().stream().filter(part -> "file".equals(part.getName()))
                    .collect(Collectors.toList());

            for (Part filePart : fileParts) {
                String fileName = getFileName(filePart);
                String filePath = uploadPath + File.separator + fileName;
                filePart.write(filePath);
                
                
                // 파일을 DB에 저장하는 로직을 추가하세요
                
                
                // 여기서 filePath를 이용하여 파일 경로를 DB에 저장할 수 있습니다
            }

            response.getWriter().println("파일 업로드가 완료되었습니다.");
        } catch (Exception e) {
            response.getWriter().println("파일 업로드에 실패하였습니다.");
            e.printStackTrace();
        }
    }

    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] tokens = contentDisp.split(";");

        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
    }
		// 상품옵션
		
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
