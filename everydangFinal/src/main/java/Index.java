

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.everydang.post.service.BoardService;
import com.everydang.post.service.IBoardService;
import com.everydang.vo.BoardVO;

@WebServlet("/index.do")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		IBoardService service = BoardService.getInstance();
		// 멍멍게시판 글 불러오기
		List<BoardVO> bowwowList = service.selectPostForMain("bowwow");
		request.setAttribute("bowwowList", bowwowList);
		
		// 공지사항 글 불러오기
		List<BoardVO> noticeList = service.selectPostForMain("notice");
		request.setAttribute("noticeList", noticeList);
		
		// 찾습니다 글 불러오기
		List<BoardVO> wikiList = service.selectPostForMain("wiki");
		request.setAttribute("wikiList", wikiList);
			
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
