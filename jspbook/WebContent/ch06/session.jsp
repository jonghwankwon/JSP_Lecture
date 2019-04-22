<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ch06 : session.jsp</title>
</head>
<body>
	<div align="center">
		<h2>session 예제</h2>
		<hr>
		<%
			//session.invalidate();
			session.setAttribute("login", "홍길동");
			// isNew() 메소드를 이용해 최초세션설정을 확인
			if (session.isNew()) {
				out.print("<script> alert('세션이 해제되어 다시 설정합니다.')</script>");
				session.setAttribute("login", "홍길동");
			}
		%>
		#<%=session.getAttribute("login")%> 님 환영합니다!!<br> 
		1. 세션 ID : <%=session.getId()%><br> 
		2. 세션 유지 시간 : <%=session.getMaxInactiveInterval()%><br>
	</div>
</body>
</html>