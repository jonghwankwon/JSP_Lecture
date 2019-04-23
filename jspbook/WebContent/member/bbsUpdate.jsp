<%@page import="member.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bbsupdate.jsp</title>
</head>
<body>
	<center>
		<%
			request.setCharacterEncoding("UTF-8");
			BbsDTO bDto = (BbsDTO) request.getAttribute("bdto");
		%>
		<h3>글 수정</h3>
		<hr>
		<!-- <form name="updateForm" action="/jspbook/member/updateMemberServlet" method=post> -->
		<form name="bbsUpdateForm"
			action="/jspbook/member/bbsProcServlet?action=update" method=post>
			<label><span>제목 : </span>
			<input type="text" name="title" value="<%=bDto.getTitle()%>" size="100"></label><br>
			<label><span>내용 : </span>
			<input type="text" name="content" value="<%=bDto.getContent()%>" size="100"></label><br>
			<input type="submit" value="수정 완료" name="B1">&nbsp;&nbsp; 
			<input type="reset" value="수정 취소" name="B2">
		</form>
	</center>
</body>
</html>