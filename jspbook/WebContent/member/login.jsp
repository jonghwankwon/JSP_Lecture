
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
<style>
tr{
background-color: #BCA9F5;
}
td {
	text-align: center;
}
</style>
</head>
<center>
	<br>
	<h3>로그인</h3>
	<br>
	<hr>
	<form name="loginForm"
		action="/jspbook/member/memberProcServlet?action=login" method=post>
		<table border="1" bordercolor="black">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" size="15"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password" size="15"></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="로그인" name="B1">&nbsp;&nbsp;
				<input type="reset" value="취소" name="B2">
				</td>
			</tr>
		</table>
	</form>
	<br>
	<button onclick="location.href='register.html'">회원 가입</button>
</center>
</body>
</html>