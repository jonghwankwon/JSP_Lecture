package jspbook.ch04;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(description = "계산기", urlPatterns = { "/ch04/Calc" })
public class CalcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//GET 요청을 처리하기 위한 메소드
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request, response); //doPost()로 포워딩
	}

	//POST 요청을 처리하기 위한 메소드
	//doGet()에서도 호출했으므로 모든 요청은 doPost()에서 처리되는 구조
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		//변수 선언
		int num1, num2, result;
		String op;

		response.setContentType("text/html;charset=UTF-8;"); // 클라이언트 응답시 전달될 컨텐트에 대한 mime type과 캐릭터셋 지정
		PrintWriter out = response.getWriter(); //클라이언트 응답을 위한 출력 스트림 확보

		//HTML 폼을 통해 전달된 num1, num2 매개변수 값을 변수에 할당
		//이때 getParameter()메소드는 문자열을 반환하므로 숫자형 데이터의 경우 Integer.parseInt()를 통해 int로 변환
		num1 = Integer.parseInt(request.getParameter("num1"));
		num2 = Integer.parseInt(request.getParameter("num2"));
		op = request.getParameter("operator"); 
		
		Calc calc = new Calc(num1, num2, op);
		result = calc.result;	//calc() 메소드 호출로 결과를 받아온다

		//출력 스트림을 통해 화면 구성
		out.println("<html>");
		out.println("<head><title>계산기</title></head>");
		out.println("<body><center>");
		out.println("<h2>계산결과</h2>");
		out.println("<hr>");
		out.println(num1+" "+op+" "+num2+"="+result);
		out.println("</body></html>");
	}
}
