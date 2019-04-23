package member;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/member/bbsProcServlet")
public class BbsProc extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BbsProc() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BbsDAO bDao = null;
		BbsDTO bDto = null;
		RequestDispatcher rd = null;
		int id = 0;
		String title = null;
		String date = null;
		String content = null;
		String message = null;
		String url = null;
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		int memberId = (int)session.getAttribute("memberId");
		String action = request.getParameter("action");
		
		//글쓰기 | 2.조회 | 3.수정 | 4.삭제 | 5.상세조회 
		switch(action) {
		case "write":	//글쓰기
			title = request.getParameter("title");
			content = request.getParameter("content");
			bDto = new BbsDTO(memberId,title,content);
			bDao = new BbsDAO();
			bDao.writeBbs(bDto);
			bDao.close();
			
			response.sendRedirect("bbsMain.jsp");
			break;
		case "update":	//수정
			
		case "list":	//조회
			
		case "delete":	//삭제
		
			break;
		
		}
	}
}