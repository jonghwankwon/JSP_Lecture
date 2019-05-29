package unit07;

import java.io.IOException;

import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddtionServlet")
public class AddtionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddtionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num1 = 20;
		int num2 = 10;
		int add = num1 + num2;
		
		//서버에 값 저장
		request.setAttribute("num1", num1);
		request.setAttribute("num2", num2);	
		request.setAttribute("add", add);
		
		//포워드 방식
		RequestDispatcher rd = request.getRequestDispatcher("EL/07_add.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
