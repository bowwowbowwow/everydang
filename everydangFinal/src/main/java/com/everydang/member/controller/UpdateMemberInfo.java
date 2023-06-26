package com.everydang.member.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.everydang.member.service.IMemberService;
import com.everydang.member.service.MemberService;
import com.everydang.vo.MemberVO;
import com.google.gson.Gson;

@WebServlet("/updateMemberInfo.do")
public class UpdateMemberInfo extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String mm_id = (String) request.getParameter("Id");
        IMemberService service = MemberService.getInstance();

        // 회원의 정보
        MemberVO memberVo = service.selectMemberInfo(mm_id);

        String imageFile = memberVo.getMm_profile();
        if (imageFile == null)
            imageFile = "noimage.png";

        // 이미지가 저장된 폴더 설정
        String filepath = request.getServletContext().getRealPath("/images");
        File file = new File(filepath, imageFile);

        BufferedInputStream bin = null;
        BufferedOutputStream bout = null;
        if (file.exists()) { // 이미지 파일이 있을 때...
            try {
                // 출력용 스트림
                if (!response.isCommitted()) { // 응답이 커밋되지 않은 경우에만 forward
                    bout = new BufferedOutputStream(response.getOutputStream());

                    // 파일 입력용 스트림
                    bin = new BufferedInputStream(new FileInputStream(file));

                    // 이미지 타입에 따라 Content-Type 설정
                    String contentType = getServletContext().getMimeType(file.getName());
                    response.setContentType(contentType);

                    byte[] temp = new byte[1024];
                    int len = 0;

                    while ((len = bin.read(temp)) > 0) {
                        bout.write(temp, 0, len);
                    }
                    bout.flush();
                }
            } catch (Exception e) {
                System.out.println("입출력 오류 : " + e.getMessage());
            } finally {
                if (bin != null)
                    try {
                        bin.close();
                    } catch (IOException e) {
                    }
                if (bout != null)
                    try {
                        bout.close();
                    } catch (IOException e) {
                    }
            }
        }
        

        request.setAttribute("selectMemberInfo", memberVo);

        // forward 호출 이전에 응답이 커밋되었는지 확인
        if (!response.isCommitted()) {
            request.getRequestDispatcher("/sub/member/myPage/myPageUpdateMain.jsp").forward(request, response);
        }
    }
}
