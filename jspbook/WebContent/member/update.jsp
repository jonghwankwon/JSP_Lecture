<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>
<style>
table {
	width: 50%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
	text-align: center;
}

th:nth-child(2n), td:nth-child(2n) {
	background-color: #bbdefb;
}

th:nth-child(2n+1), td:nth-child(2n+1) {
	background-color: #e3f2fd;
}
</style>
</head>
<body>
	<center>
		<h3>회원 수정</h3>
		<hr>
		<c:set var="member" value="${requsetScope.member }" />
		<form name="updateForm"
			action="/jspbook/member/memberProcServlet?action=execute" method=post>
			<input type="hidden" id="id" name="id" value="${member.id }">
			<table>
				<tr>
					<th>아이디:</th>
					<th>${member.id }</th>
				</tr>
				<tr>
					<th>이름:</th>
					<th><input type="text" name="name" value="${member.name }"
						size="10"></th>
				</tr>
				<tr>
					<th>생일:</th>
					<th><input type="text" name="birthday"
						value="${member.birthday }" size="10"></th>
				</tr>
				<tr>
					<th>주소:</th>
					<th><input type="text" name="address"
						value="${member.address }" size="30"></th>
				</tr>
				<tr>
					<th colspan="2"><input type="submit" value="회원 수정" name="B1">&nbsp;&nbsp;
						<input type="reset" value="재작성" name="B2">&nbsp;&nbsp; <input
						type=button value="뒤로가기" name="B3" onClick="history.back()">
				</tr>
			</table>
		</form>
	</center>
</body>
</html>