package member;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MemberProc
 */
@WebServlet("/member/memberProcServlet")
public class MemberProc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberProc() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
/*		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		System.out.println("doGet(): " + uri + ", " + conPath + ", " + command);
*/		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
/*		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		System.out.println("doPost(): " + uri + ", " + conPath + ", " + command);
*/		doAction(request, response);
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO mDao = null;
		MemberDTO member = null;
		RequestDispatcher rd = null;
		int id = 0;
		int mcurPage = 1;
		int memberId = 0;
		String password = null;
		String name = null;
		String birthday = null;
		String address = null;
		String message = null;
		String url = null;
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		String action = request.getParameter("action");
		List<String> mpageList = new ArrayList<String>();
		
		switch(action) {
		case "list":
			if (!request.getParameter("mpage").equals("")) {
				mcurPage = Integer.parseInt(request.getParameter("mpage"));
			}
			mDao = new MemberDAO();
			int mcount = mDao.getCount();
			if (mcount == 0)			// 데이터가 없을 때 대비
				mcount = 1;
			int mpageNo = (int)Math.ceil(mcount/10.0);
			if (mcurPage > mpageNo)	// 경계선에 걸렸을 때 대비
				mcurPage--;
			session.setAttribute("currentMemPage", mcurPage);
			
			// 리스트 페이지의 하단 페이지 데이터 생성
			String mpage = null;
			mpage = "<a href=#>&laquo; back</a>&nbsp;"; //원본
			mpageList.add(mpage);
			for (int i=1; i<=mpageNo; i++) {
				if(mcurPage == i)
					mpage = "&nbsp;" + i + "&nbsp;";
				else
				mpage = "&nbsp;<a href=memberProcServlet?action=list&mpage=" + i + ">" + i + "</a>&nbsp;";
				mpageList.add(mpage);
			}
			mpage = "&nbsp;<a href=#>next &raquo;</a>";
			mpageList.add(mpage);
			
			List<MemberDTO> mList = mDao.selectAll(mcurPage);
			request.setAttribute("MemberList", mList);
			request.setAttribute("mpageList", mpageList);
			rd = request.getRequestDispatcher("loginMain.jsp");
	        rd.forward(request, response);
			break;
		
		case "update":		// 수정
			if (!request.getParameter("id").equals("")) {
				id = Integer.parseInt(request.getParameter("id"));
			}
			if (id != (Integer)session.getAttribute("memberId")) {
				message = "id = " + id + " 에 대한 수정 권한이 없습니다.";
				url = "memberProcServlet?action=list&mpage=" + mcurPage;
				request.setAttribute("url", url);
				rd = request.getRequestDispatcher("alertMsg.jsp");
				rd.forward(request, response);
				break;
			}
			mDao = new MemberDAO();
			member = mDao.searchById(id);
			mDao.close();
			request.setAttribute("member", member);
			rd = request.getRequestDispatcher("update.jsp");
	        rd.forward(request, response);
	        break;
	        
		case "delete":		// 삭제
			if (!request.getParameter("id").equals("")) {
				id = Integer.parseInt(request.getParameter("id"));
			}
			if (id != (Integer)session.getAttribute("memberId")) {
				message = "id = " + id + " 에 대한 삭제 권한이 없습니다.";
				request.setAttribute("message", message);
				request.setAttribute("url", url);
				mcurPage = (int)session.getAttribute("currentMemPage");
				url = "memberProcServlet?action=list&mpage=" + mcurPage;
				rd = request.getRequestDispatcher("alertMsg.jsp");
				rd.forward(request, response);
				break;
			}
			mDao = new MemberDAO();
			mDao.deleteMember(id);
			mDao.close();
			message = "id = " + id + " 이/가 삭제되었습니다.";
			request.setAttribute("message", message);
			request.setAttribute("url", url);
			mcurPage = (int)session.getAttribute("currentMemPage");
			url = "memberProcServlet?action=list&mpage=" + mcurPage;
			rd = request.getRequestDispatcher("alertMsg.jsp");
			rd.forward(request, response);
			
		case "login":		// login 할 때
			if (!request.getParameter("id").equals("")) {
				id = Integer.parseInt(request.getParameter("id"));
			}
			password = request.getParameter("password");
			
			mDao = new MemberDAO();
			int result = mDao.verifyIdPassword(id, password);
			String errorMessage = null;
			switch (result) {
			case MemberDAO.ID_PASSWORD_MATCH:
				break;
			case MemberDAO.ID_DOES_NOT_EXIST:
				errorMessage = "ID가 없음"; break;
			case MemberDAO.PASSWORD_IS_WRONG:
				errorMessage = "패스워드가 틀렸음"; break;
			case MemberDAO.DATABASE_ERROR:
				errorMessage = "DB 오류";
			}
			
			if (result == MemberDAO.ID_PASSWORD_MATCH) {
				member = mDao.searchById(id);
				session.setAttribute("memberId", id);
				session.setAttribute("memberName", member.getName());
				response.sendRedirect("memberProcServlet?action=list&mpage=1");
			} else {
				request.setAttribute("message", errorMessage);
				request.setAttribute("url", "login.jsp");
				rd = request.getRequestDispatcher("alertMsg.jsp");
		        rd.forward(request, response);
			}
			mDao.close();
			break;
		
		case "logout":			// 로그아웃할 때
			session.removeAttribute("memberId");
			session.removeAttribute("memberName");
			response.sendRedirect("login.jsp");
			break;
			
		case "register":		// 회원 등록할 때
			password = request.getParameter("password");
			name = request.getParameter("name");
			birthday = request.getParameter("birthday");
			address = request.getParameter("address");
			member = new MemberDTO(password, name, birthday, address);
			System.out.println(member.toString());
			
			mDao = new MemberDAO();
			mDao.insertMember(member);
			member = mDao.recentId();
			session.setAttribute("memberId", member.getId());
			session.setAttribute("memberName", name);
			
			message = "귀하의 아이디는 " + member.getId() + " 입니다.";
			url = "memberProcServlet?action=list&mpage=1";
			request.setAttribute("message", message);
			request.setAttribute("url", url);
			rd = request.getRequestDispatcher("alertMsg.jsp");
			rd.forward(request, response);
			mDao.close();
			break;
			
		case "execute":			// 회원 수정정보 입력 후 실행할 때
			if (!request.getParameter("id").equals("")) {
				id = Integer.parseInt(request.getParameter("id"));
			}
			name = request.getParameter("name");
			birthday = request.getParameter("birthday");
			address = request.getParameter("address");
			
			member = new MemberDTO(id, "*", name, birthday, address);
			System.out.println(member.toString());
			
			mDao = new MemberDAO();
			mDao.updateMember(member);
			mDao.close();
			
			message = "다음과 같이 수정하였습니다.\\n" + member.toString();
			request.setAttribute("message", message);
			mcurPage = (int)session.getAttribute("currentMemPage");
			url = "memberProcServlet?action=list&mpage=" + mcurPage;
			request.setAttribute("url", url);
			rd = request.getRequestDispatcher("alertMsg.jsp");
	        rd.forward(request, response);
			break;
			
		default:
		}
	}
}