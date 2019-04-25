<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//한글 캐릭터셋 변환
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ch06 : twitter_list.jsp</title>
</head>
<body>
	<div align="center">
		<h2>My Simple Twitter!!</h2>
		<a href="loginMain.jsp">회원 목록으로</a>
		<hr>
		<form action="/jspbook/member/twitServlet" method="POST">
			<!-- 세션에 저장된 이름 출력 -->
			@${memberName} ☞ <input type="text" name="msg"> <input
				type="submit" value="Tweet">
		</form>
		<hr>
	</div>
	<div align="left">
		<ul>
			<!-- application 내장객체를 통해 msgs 이름으로 저장된 ArrayList를 가지고 옴 -->
			<c:set var="msgs" value="${applicationScope.msgs}" />
			<!-- msgs가 null 이 아닌 경우에만 목록 출력 -->
			<c:if test="${not empty msgs}">
				<c:forEach var="msg" items="${msgs}">
					<li>${msg}</li>
				</c:forEach>
			</c:if>
		</ul>
	</div>
</body>
</html>