<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
td{
text-align: center;
}
</style>
</head>
<body>
	<form action="login.jsp">
		<table border="1px solid;">
			<tr>
				<td><label for="id">아이디</label></td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td><label for="passwd">암호</label></td>
				<td><input type="text" name="passwd"></td>
			</tr>
			<tr>
				<td colspan="4">
				<input type="radio" name="login" id="user" value="user">
				<label for="user">사용자</label>
				<input type="radio" name="login" id="admin" value="admin">
				<label for="admin">관리자</label>
				</td>
			</tr>
			<tr>
				<td colspan="4"><input type="submit" value="로그인"></td>
			</tr>
		</table>
	</form>

</body>
</html>