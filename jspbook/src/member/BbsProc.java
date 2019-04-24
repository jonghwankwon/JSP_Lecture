package member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.RequestWrapper;


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
			if (!request.getParameter("id").equals("")) {
				id = Integer.parseInt(request.getParameter("id"));
			}
			bDao = new BbsDAO();
			bDto = bDao.selectOne(id);	//DB에서 memberId를 가져와서 권한체크
			bDao.close();	
			if (memberId != bDto.getMemberId()) {	//bbsmemberId와 login한 memberId가 != 수정불가능 alert창 출력
				message = "해당 게시글 " + id + " 에 대한 수정 권한이 없습니다.";
				url = "bbsMain.jsp";
				request.setAttribute("message", message);
				request.setAttribute("url", url);
				rd = request.getRequestDispatcher("alertMsg.jsp");
				rd.forward(request, response);
				break;
			}	
			request.setAttribute("bDto", bDto);
			rd = request.getRequestDispatcher("bbsUpdate.jsp");
			rd.forward(request, response);
			break;

		case "excute":	//수정 버튼 클릭 시
			title = request.getParameter("title");
			content = request.getParameter("content");
			id = Integer.parseInt(request.getParameter("id"));
			bDto.setTitle(title);
			bDto.setContent(content);
			bDto.setId(id);
			bDao.updateBbs(bDto);
			message = "글 " + title + " 이/가 수정 되었습니다.";
			url = "bbsMain.jsp";
			request.setAttribute("message", message);
			request.setAttribute("url", url);
			rd = request.getRequestDispatcher("alertMsg.jsp");
			rd.forward(request, response);

		case "view":	//상세조회
			if (!request.getParameter("id").equals("")) {
				id = Integer.parseInt(request.getParameter("id"));
			}
			bDto = bDao.selectOne(id);
			bDao.close();
			request.setAttribute("bDto", bDto);
			rd = request.getRequestDispatcher("bbsView.jsp");
			rd.forward(request, response);
			break;

		case "delete":	//삭제
			if (!request.getParameter("id").equals("")) {
				id = Integer.parseInt(request.getParameter("id"));
			}
			bDao = new BbsDAO();
			bDto = bDao.selectOne(id);	//DB에서 memberId를 가져와서 권한체크
			bDao.close();	
			if (memberId != bDto.getMemberId()) {
				message = "id = " + id + " 에 대한 삭제 권한이 없습니다.";
				url = "bbsMain.jsp";
				request.setAttribute("message", message);
				request.setAttribute("url", url);
				rd = request.getRequestDispatcher("alertMsg.jsp");
				rd.forward(request, response);
				break;
			}
			bDao = new BbsDAO();
			bDao.deleteBbs(id);
			bDao.close();
			message = "id = " + id + " 이/가 삭제되었습니다.";
			url = "bbsMain.jsp";
			request.setAttribute("message", message);
			request.setAttribute("url", url);
			rd = request.getRequestDispatcher("alertMsg.jsp");
			rd.forward(request, response);

		default:
		}
	}
}