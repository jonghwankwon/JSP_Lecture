<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bbsupdate.jsp</title>
<style type="text/css">
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
		
		<h2>글 수정</h2>
		<hr>
		<!--  -->
		<c:set var="bm" value="${requestScope.bbsMember}"/>
		<form name="bbsupdateForm" action="bbsProcServlet?action=execute&id=${bm.id }" method=post>
		<input type="hidden" id="id" name="id" value="${bm.id}">
		<input type="hidden" id="action" name="action" value="excute">
			<table border="1">
				<tr>
					<th>항목</th>
					<th>내용</th>
				</tr>
				<tr>
					<th>글번호</th>
					<td>${bm.id }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" value="${bm.title}" size="10"></td>
				</tr>
				<tr>
					<th>글쓴이</th>
					<td>${bm.name}</td>
				</tr>
				<tr>
					<th>수정일시</th>
					<td>${bm.date}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="content" rows="5" cols="40">${bm.content}</textarea></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="submit" value="수정 완료" name="B1">&nbsp;&nbsp;
					<input type="reset" value="재수정" name="B2">&nbsp;&nbsp; 
					<input type=button value="뒤로가기" name="B3" onClick="history.back()">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>