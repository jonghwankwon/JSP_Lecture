<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
<style>
label span {
	display: inline-block;
	width: 90px;
	text-align: right;
	padding: 10px;
}
</style>
</head>
<%
	// loginProc.jsp를 보고 getParameter/getAttribute 정하기
	String error = (String) request.getParameter("error");	//Parameter로 받을 때 
//	String error = (String) request.getAttribute("error");	//Attribute로 받을 때
	if (error != null) {
		System.out.println(error);
		out.println("<script>alert('" + error + "')</script>");
	}
%>
<center>
	<br>
	<h3>Member Login</h3>
	<br>
	<hr>a
	<form name="loginForm" action=/jspbook/member/loginProcServlet
		method=post>
		<label><span>ID:</span> <input type="text" name="id" size="10"></label>
		<label><span>Password:</span> <input type="password"
			name="password" size="10"></label><br> <input type="submit"
			value="로그인" name="B1">&nbsp;&nbsp; <input type="reset"
			value="취소" name="B2">
	</form>
	<br> <br>
	<button onclick="location.href='register.html'">회원 가입</button>
</center>
</body>
</html>