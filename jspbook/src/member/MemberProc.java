package member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/memberProcServlet")
public class MemberProc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberProc() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO mDao = null;
		RequestDispatcher rd = null;
		int id = 0;
		String action = request.getParameter("action");
		if (!request.getParameter("id").equals("")) {
			id = Integer.parseInt(request.getParameter("id"));
		}
		/*String action = request.getParameter("action");
		String strId = request.getParameter("id");
		System.out.println(action + ", " + strId);*/
		
		//정보 수정
		switch (action) {
		case "update":
			mDao = new MemberDAO();
			MemberDTO member = mDao.searchById(id);
//			System.out.println(member.toString());	// 오류의 위치를 알아내기위해 사용
			mDao.close();
			request.setAttribute("member", member);
			rd = request.getRequestDispatcher("update.jsp");
	        rd.forward(request, response);
	        break;
	        
		case "delete": //삭제 버튼 클릭 시
			mDao = new MemberDAO();
			mDao.deleteMember(id);
			mDao.close();
			//response.sendRedirect("loginMain.jsp");
			String message = "id [" + id + "]가 삭제 되었습니다.";
			String url = "loginMain.jsp";
			request.setAttribute("message", message);
			request.setAttribute("url", url);
			rd = request.getRequestDispatcher("alertMsg.jsp");
			rd.forward(request, response);
			break;
			
		default:
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
