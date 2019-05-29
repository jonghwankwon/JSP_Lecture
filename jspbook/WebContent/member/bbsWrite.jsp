<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bbswrite.jsp</title>
<style>
label span {
	display: inline-block;
	width: 100px;
	text-align: center;
	padding: 15px;
}
</style>
</head>
<body>
	<center>
		<c:set var="bm" value="${requestScope.bbsMember}"/>
		<h3>글쓰기</h3>
		<hr>
		<br>
		<form name="bbswriteForm"
			action="/jspbook/member/bbsProcServlet?action=write" method=post>
			<span>제목 : </span> <input type="text" name="title" width="50"><br><br>
			<span>내용 : </span><textarea name="content" cols="40" rows="10"></textarea><br>
			<label><span></span><br> <input type="submit"
				value="작성완료" name="B1">&nbsp;&nbsp;&nbsp;&nbsp; <input
				type="reset" value="재작성" name="B2">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type=button value="뒤로가기" onClick="history.back()"></label>
		</form>
	</center>
</body>
</html>